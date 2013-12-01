module Utils.Inputs (controls, urlString) where

import Graphics.Input as Input
import Utils.HttpFunctions (prettyPrint, sendReq)
import Utils.Validation (validate)

-- Inputs
(isbn , isbnSignal)  = Input.field "ISBN"
(price, priceSignal) = Input.field "Price"
(buy  , buyEvent)    = Input.button "Buy"
(sell , sellEvent)   = Input.button "Sell"

-- Actually validate the inputs
validIsbn = (\n -> validate n True) <~ isbnSignal
validPrice = (\n -> validate n False) <~ priceSignal 

-- Url source of the ISBN script
url' = "/php/checkISBN.php?isbn="

urlString =
  let queryString s = case s of
        "" -> url' ++ "0"
        _  -> url' ++ s 
      srq isbn = sendReq (dropRepeats (queryString <~ isbn)) "get"
  in (prettyPrint <~ srq validIsbn)

urlelem = plainText <~ validIsbn 
    
-- Visual Layout
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
