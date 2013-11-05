{-
  This modified version of the Zip Code example from elm-lang.org shows
  how to use the JSON and JavaScript.Experimental libraries to get a value from
  the result of an HTTP GET request.
-}

import Char
import String
import Maybe
import Http
import Json
import JavaScript.Experimental as JS
import Graphics.Input as Input
import Window

-- Inputs
(field,rawInput) = Input.field "Enter ISBN (hosted) or /path/file (local)"
(box,checked) = Input.checkbox False

remoteString = "/checkISBN.php?isbn=" 
localString = ""
-- Covert raw input into a usable URL.
toUrl s isChecked = case isChecked of 
  True -> Just (localString ++ s)
  False -> 
    if (String.length s == 10 || String.length s == 13) && String.all Char.isDigit s 
    then Just (remoteString ++ s)
    else Nothing

-- Transform the signal of raw input into usable data, indicating if the input
-- is valid and, if so, what it is.
realInput = toUrl <~ rawInput ~ checked

-- Send AJAX requests for any valid input!
responses = Http.sendGet (lift (Maybe.maybe "" id) realInput)

-- Show the result of converting JSON string into an Elm record
convert a = (plainText . show <| stringToRecord a) |> width 200
-- Convert a JSON string into an Elm record
stringToRecord str = case Json.fromString str of
    Just jsonValue -> [(JS.toRecord (Json.toJSObject jsonValue)).Title, (JS.toRecord (Json.toJSObject jsonValue)).imageURL]
    Nothing -> [Nothing]

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
    prettyBox = container 30 16 middle box |> color lightBlue
    msgDescrip = case msg of 
      True -> "  local"
      False -> "  hosted"
  in flow right [ plainText "Check box for localhost or real webpage:   ", prettyBox, plainText msgDescrip ]
everything (w,h) x = let 
    w' = w `div` 2
    h' = h - 300
  in flow down [ container w h' middle x, md w ]
resizedInput i w = let
    w' = w `div` 2
  in size w' 28 i
inputBar = resizedInput <~ field ~ Window.width
prettyBox = boxContainer <~ box ~ checked
md w = width w [markdown|

## What is this?
To test with provided JSON data, type "/path/to/file/ReturnedData.html" in the text box,
and make sure the check box is set to "local".

This lets you type any relative path in the box and will do an HTTP GET request each time the input changes.
(check browser console for details)

To test with an ISBN number, set the check box to "hosted" and type an ISBN number
in the check box. This sends a GET request only when you type 10 or 13 digits.

|]

-- Main function, put it all together
main = everything <~ Window.dimensions ~ (\n-> flow down <~ (combine n)) [ inputBar, message, prettyBox ]
