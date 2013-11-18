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
(author,rawInput) = Input.field "Author"
(title,titleInput) = Input.field "Title"
(description,descriptionInput) = Input.field "Description"
(price,priceInput) = Input.field "Price"
(box,checked) = Input.checkbox True 

remoteString = "/checkISBN.php?isbn=" 
localString = ""

toUrl s isChecked = case isChecked of -- Convert valid input to URL
  True -> Just s
  False -> 
    if (String.length s == 10 || String.length s == 13) && String.all Char.isDigit s 
    then Just (remoteString ++ s)
    else Nothing

-- Transform the signal of raw input into usable data, indicating if the input
-- is valid and, if so, what it is.
realInput = toUrl <~ (sampleOn entered rawInput) ~ checked

-- Send AJAX requests for any valid input!
responses = Http.sendGet ((Maybe.maybe "" id) <~ realInput)


-- Show the returned JSON in some cool format
showJson jsonValue = (JS.toRecord (Json.toJSObject jsonValue))

-- Convert a JSON string into an Elm record
stringToRecord str = case Json.fromString str of
    Just jsonValue -> showJson jsonValue
    Nothing -> Nothing
    -- (JS.toRecord (Json.toJSObject jsonValue)).Title, (JS.toRecord (Json.toJSObject jsonValue)).imageURL]

-- Display --
display response = 
  case response of
    Http.Success address -> convert address
    Http.Waiting -> plainText "waiting" 
    Http.Failure _ _ -> asText response

-- Give the user a message depending on whether their input is valid and
-- the response from any AJAX requests.
message =
  let msg = plainText "Enter the ISBN number of your book to see its information."
      output inp rsp = Maybe.maybe msg (\_ -> display rsp) inp
  in lift2 output realInput responses

-- Show the result of converting JSON string into an Elm record
convert a = flow right [spacer 20 20, (plainText . show <| stringToRecord a) |> width 600 ]

-- Show all the main elements
everything (w,h) x = let 
    w' = round(toFloat w / 2) -- w `div` 2
  in flow down [ width w' x ]

resizedInput i w = let
    w' = round(toFloat w / 2) -- w `div` 2
  in container w 30 middle <| size w' 28 i 

inputBar = resizedInput <~ price ~ Window.width



-- Main function, put it all together
main = everything <~ Window.dimensions ~ (\n-> flow down <~ (combine n)) [ inputBar, message, constant (spacer 0 10) ]

-----------------
-- Other stuff --
-----------------

-- Helper Functions
-- Signal for 'enter' keypress
entered = keepIf id True Keyboard.enter
combiner = (\n -> flow down <~ combine n)
