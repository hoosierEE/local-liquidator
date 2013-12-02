module Utils.Inputs (controls, urlString) where

import Graphics.Input as Input
import Utils.HttpFunctions (prettyPrint, sendReq)
import Utils.Validation (validate)

-- Model
(isbn , isbnSignal)  = Input.field "ISBN"
(price, priceSignal) = Input.field "Price"
(buy  , buyEvent)    = Input.button "Buy"
(sell , sellEvent)   = Input.button "Sell"

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
  in arranged <~ isbn ~ price ~ btngroup ~ urlelem

urlelem = plainText <~ validIsbn

-- Controller
validIsbn  = (\n -> validate n True)  <~ isbnSignal
validPrice = (\n -> validate n False) <~ priceSignal 

ready = let blarg x = case x of
    "" -> False
    _  -> True
  in blarg <~ validIsbn

urlString =
  let scriptPath = "/php/checkISBN.php?isbn="
      queryString s = case s of
        "" -> "0" -- scriptPath
        _  -> scriptPath ++ s 
      srq i = sampleOn i (sendReq (dropRepeats (queryString <~ i)) "post")
  in prettyPrint <~ srq validIsbn
