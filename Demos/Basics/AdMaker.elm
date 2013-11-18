module AdMaker (adArea) where

import Graphics.Input as Input
import Char
import Maybe
import String

-- Inputs
(isbn   , isbnSignal ) = Input.field "ISBN"
(price  , priceSignal) = Input.field "Price"
(buyBtn , buy        ) = Input.button "Buy"
(sellBtn, sell       ) = Input.button "Sell"

validate : String -> Bool -> String
validate x isbn = 
  if isbn 
  then if (String.all Char.isDigit x && (String.length x == 10 || String.length x == 13))
    then x else ""
  else case (String.toFloat x) of
    Nothing -> ""
    Just x -> show x

-- Visuals
btnGroup : Element
btnGroup = flow right [buyBtn, sellBtn]

preview : String -> String -> Element
preview isbn price =
  let arrange [a,b,c,d] =
    let title = width 200 . centered . Text.bold <| toText "Ad Preview"
    in flow down [title, flow right [a,b], flow right[c,d]]
  in arrange <| map plainText ["ISBN Number: ", (validate isbn True), "Price: $", (validate price False)]

previewArea : Signal Element
previewArea = preview <~ isbnSignal ~ priceSignal

adArea : Signal Element
adArea = let header = width 200 . centered . Text.height 38 . Text.color darkRed <| toText "Ad Creator"
  in flow down <~ combine [constant header, isbn, price, constant btnGroup, previewArea]
