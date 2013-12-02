module Utils.Inputs (controls, isbnRequestString) where
import Graphics.Input as Input
import Utils.HttpFunctions (prettyPrint, sendReq)
import Utils.Validation (validate, btnClicked)

-- Logic
validIsbn  = (\n->validate n True ) <~ isbnSignal
validPrice = (\n->validate n False) <~ priceSignal

isbnRequestString =
  let ajax s = case s of
    "" -> "null"
    _  -> "/php/checkISBN.php?isbn=" ++ s
  in dropRepeats (ajax <~ validIsbn)

ad str = 
  let scriptString = (\n-> "/php/storeAd.php?user=ashroyer&Price=" ++ n)
  in (\n-> sendReq n "get") (scriptString <~ str)

afterClicked : Bool -> Signal String
afterClicked clik = case clik of
  True -> (prettyPrint <~ ad validPrice)
  False -> constant ""

buyTester = asText <~ (afterClicked <~ (btnClicked buyEvent))


-- Model
(isbn , isbnSignal ) = Input.field "ISBN"
(price, priceSignal) = Input.field "Price"
(buy  , buyEvent   ) = Input.button "Buy"
(sell , sellEvent  ) = Input.button "Sell"

-- View
controls =
  let
    arranged a b c d = 
      let h = map heightOf [a,b,c,d] |> foldr (+) 0
          w = map widthOf [a,b,c,d] |> maximum
          border = 10
          title = width 200 . centered . Text.height 20 . Text.color darkYellow <| toText "Controls"
      in flow down [title, flow down [a,b,c,d] |> container (w + border) (h + border) middle |> color lightBlue]
    btngroup = constant <| flow right [buy, sell]
  in arranged <~ isbn ~ price ~ btngroup ~ buyTester
