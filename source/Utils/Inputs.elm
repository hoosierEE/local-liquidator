module Utils.Inputs (controls, urlString) where

import Graphics.Input as Input
import Utils.HttpFunctions (prettyPrint, sendReq)
import Utils.Validation (validate)

-- Logic
validIsbn = (\n->validate n True) <~ isbnSignal

urlString =
  let ajax s = case s of
    "" -> "null"
    _  -> "/php/checkISBN.php?isbn=" ++ s
  in dropRepeats (ajax <~ validIsbn)

-- Model
(isbn , isbnSignal)  = Input.field "ISBN"
(price, priceSignal) = Input.field "Price"
(buy  , buyEvent)    = Input.button "Buy"
(sell , sellEvent)   = Input.button "Sell"

-- View
controls =
  let
    arranged a b c = 
      let h = map heightOf [a,b,c] |> foldr (+) 0
          w = map widthOf [a,b,c] |> maximum
          border = 10
          title = width 200 . centered . Text.height 20 . Text.color darkYellow <| toText "Controls"
      in flow down [title, flow down [a,b,c] |> container (w + border) (h + border) middle |> color lightBlue]
    btngroup = constant <| flow right [buy, sell]
  in arranged <~ isbn ~ price ~ btngroup
