{-
  This Elm code is about doing HTTP GET requests for other resources
  on our site, and (if the resource is JSON encoded) displaying the 
  returned JSON string.  
  Currently no functions are included for doing anything cool with the 
  individual JSON keys/values, but someday soon hopefully.
-}

import Char
import String
import Maybe
import Http
import Json
import JavaScript.Experimental as JS
import Graphics.Input as Input
import Window
import Keyboard

-- Inputs
(field,rawInput) = Input.field "Enter ISBN or /path/script.php?key=value"
(box,checked) = Input.checkbox True 

remoteString = "/checkISBN.php?isbn=" 
localString = ""
-- Covert raw input into a usable URL.
toUrl s isChecked = case isChecked of 
  True -> Just s
  False -> 
    if (String.length s == 10 || String.length s == 13) && String.all Char.isDigit s 
    then Just (remoteString ++ s)
    else Nothing

-- Transform the signal of raw input into usable data, indicating if the input
-- is valid and, if so, what it is.
realInput = toUrl <~ (sampleOn entered rawInput) ~ checked

-- Signal for 'enter' keypress
entered = keepIf id True Keyboard.enter

-- Send AJAX requests for any valid input!
responses = Http.sendGet ((Maybe.maybe "" id) <~ realInput)

-- Show the result of converting JSON string into an Elm record
convert a = flow right [spacer 20 20, (plainText . show <| stringToRecord a) |> width 600 ]

-- Show the returned JSON in some cool format
showJson jsonValue = (JS.toRecord (Json.toJSObject jsonValue))

-- Convert a JSON string into an Elm record
stringToRecord str = case Json.fromString str of
    Just jsonValue -> showJson jsonValue
    Nothing -> Nothing
    -- (JS.toRecord (Json.toJSObject jsonValue)).Title, (JS.toRecord (Json.toJSObject jsonValue)).imageURL]

-- Display a response.
display response = 
  case response of
    Http.Success address -> convert address
    Http.Waiting -> asText "waiting" -- image 16 16 "waiting.gif"
    Http.Failure _ _ -> asText response

-- Give the user a message depending on whether their input is valid and
-- the response from any AJAX requests.
message =
  let msg = plainText "Enter the ISBN number of your book to see its information."
      output inp rsp = Maybe.maybe msg (\_ -> display rsp) inp
  in lift2 output realInput responses

-- Put some description by our checkbox so people have some clue what it does
boxContainer box msg = let
    prettyBox = container 16 16 middle box |> color lightRed
    msgDescrip = case msg of 
      True -> "  relative URL lookup"
      False -> "  ISBN lookup"
  in flow right [ plainText "URL or ISBN lookup:   ", prettyBox, plainText msgDescrip ]

-- the main display function, flows down [reactive parts, Markdown]
everything (w,h) x = let 
    w' = round(toFloat w / 2) -- w `div` 2
  in flow down [ width w' x, md w ]

resizedInput i w = let
    w' = round(toFloat w / 2) -- w `div` 2
  in container w 30 middle <| size w' 28 i 

inputBar = resizedInput <~ field ~ Window.width

prettyBox = boxContainer <~ box ~ checked


-- Main function, put it all together
main = everything <~ Window.dimensions ~ (\n-> flow down <~ (combine n)) [ inputBar, message, constant (spacer 0 10), prettyBox ]

-----------------
-- Other stuff --
-----------------

-- Text description to display on the page
md w = let 
  w' = round(toFloat w * 0.9) 
  w'' = round (toFloat(w - w') / 2)
  marky = [markdown|
##What is this?
Here we have a simple page to verify that we can indeed interface with our database.

The text box above is dual-function:  

* With the checkbox checked, the text typed into the 
text box will be used as the contents of an HTTP GET request.

* With the checkbox unchecked, you can enter an ISBN(10 or 13) number to see what the checkISBN.php
page returns

##Usage
Test a php script by typing in the box '/phpScriptName.php?key1=value1&key2=value2' (without quotes)
where key1, value1 etc. are the parameters expected by the PHP script.

This page expects the return value to be in JSON format, and will show JSON-formatted results.  Otherwise it will 
show 'Nothing' (meaning, the actual word Nothing).

##Changes Since Previous Version
It doesn't continuously send requests as you type, now it only sends a request when you hit the Enter key.
|]
 in flow right [ spacer w'' 10, width w' marky ]
