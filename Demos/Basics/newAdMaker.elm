-- module AdMaker (adArea) where
import Graphics.Input as Input
import Char
import Maybe
import String
import Http

-- Inputs
(isbn , isbnSignal)  = Input.field "ISBN"
(price, priceSignal) = Input.field "Price"
(buy  , buyEvent)    = btnBuilder "Buy"
(sell , sellEvent)   = btnBuilder "Sell"
btnBuilder a = Input.customButton (butn 6 lightBlue a) (butn 5 lightRed a) (butn 4 lightOrange a)
butn shp clr label = collage 98 38
    [ rotate (pi/2) <| move (25,0) <| filled clr (ngon shp 12)
    , move (-15,0) <| toForm <| plainText label
    ] |> color gray

-- Business logic
isClicked : Signal () -> Signal Bool
isClicked evt =
  let always value signal = lift (\_ -> value) signal
  in merge (always False (delay 0 evt)) (always True evt)

validIsbn : String -> Bool
validIsbn s = (String.length s == 10 || String.length s == 13) && String.all Char.isDigit s

toUrl : String -> Maybe String
toUrl s = if validIsbn s then Just ("/php/checkISBN.php?isbn=" ++ s) else Nothing
-- HTTP handling
-- responses = Http.sendGet -- TODO
display response =
  case response of
    Http.Success val -> text . monospace <| toText val
    Http.Waiting -> asText ""
    Http.Failure _ _ -> asText response
message =
  let msg = plainText "Enter a valid ISBN"
    output inp rsp = Maybe.maybe msg (\_ -> display rsp) inp
  in output <~ (toUrl <~ isbnSignal) ~ responses

adArea = flow down <~ combine [isbn, message]
main = adArea
