import Char
import String
import Maybe
import Http
import Graphics.Input as Input

(field,rawInput) = Input.field "ISBN number"

-- convert raw input into usable URL
toUrl s = Just s
  {-
  if (String.length s == 10 || String.length s == 13) && String.all Char.isDigit s
  then Just ("http://www.local-liquidator.com/checkISBN.php?isbn=" ++ s)
  else Nothing
  -}

-- turn input signal into data, indicating if valid input and if so, what it is
realInput = lift toUrl rawInput

-- send AJAX requests for any valid input!
responses = Http.sendGet (lift (Maybe.maybe "" id) realInput)

-- Display a response
display response = 
  case response of
    Http.Success address -> text . monospace <| toText address
    Http.Waiting -> fittedImage 100 100 "/shells.jpg"
    Http.Failure _ _ -> asText response

-- Give the user a message depending on whether their input is valid and
-- teh response from any AJAX requests
message =
  let msg = plainText "Enter the ISBN (10 or 13) of the book you wish to display."
      output inp rsp = Maybe.maybe msg(\_ -> display rsp) inp
  in lift2 output realInput responses

main = lift2 above field message
