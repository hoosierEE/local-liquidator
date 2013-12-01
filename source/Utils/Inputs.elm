module Utils.Inputs (creator) where

import String
import Char
import Graphics.Input as Input

-- Inputs
(isbn , isbnSignal)  = Input.field "ISBN"
(price, priceSignal) = Input.field "Price"
(buy  , buyEvent)    = Input.button "Buy"
(sell , sellEvent)   = Input.button "Sell"

-- Input Valication Logic
validate : String -> Bool -> String
validate x isIsbn = case isIsbn of
  True -> if (String.all Char.isDigit x && (String.length x == 10 || String.length x == 13)) then x else ""
  False -> case (String.toFloat x) of
    Nothing -> ""
    Just x -> show x

-- Actually validate the inputs
validIsbn = (\n -> validate n True) <~ isbnSignal
validPrice = (\n -> validate n False) <~ priceSignal 

creator =
  let
    arranged a b c = flow down [a,b,c]
    btngroup = constant <| flow right [buy, sell]
  in arranged <~ isbn ~ price ~ btngroup
