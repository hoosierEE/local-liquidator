module AdMaker (adArea) where

import Graphics.Input as Input
import Char
import Maybe
import String
import Visuals.CustomControls (btnBuilder)

-- Inputs
(isbn , isbnSignal)  = Input.field "ISBN"
(price, priceSignal) = Input.field "Price"
(buy  , buyEvent)    = btnBuilder "Buy"
(sell , sellEvent)   = btnBuilder "Sell"
-- Form Valication Logic
validate : String -> Bool -> String
validate x i = case i of
  True -> if (String.all Char.isDigit x && (String.length x == 10 || String.length x == 13)) then x else ""
  False -> case (String.toFloat x) of
    Nothing -> ""
    Just x -> show x

isClicked : Signal () -> Signal Bool
isClicked evt =
  let always value signal = lift (\_ -> value) signal
  in merge (always False (delay 0 evt)) (always True evt)
-- toUrl s = ("/php/checkISBN.php?isbn=" ++  

-- Visuals
btnGroup : Element
btnGroup = flow right [buy, spacer 4 4, sell]

preview : String -> String -> Element
preview isbn price =
  let arrange [a,b,c,d] =
    let title = width 200 . centered . Text.height 20 . Text.color darkRed <| toText "Ad Preview"
    in flow down [title, flow right [a,b], flow right[c,d]]
  in arrange 
    <| map plainText 
      [ "ISBN Number: "
      , (validate isbn True)
      , "Price: $"
      , (validate price False)
      ]

previewArea : Signal Element
previewArea = preview <~ isbnSignal ~ priceSignal

adArea : Signal Element
adArea = let header = width 200 . centered . Text.height 20 . Text.color darkRed <| toText "Ad Creator"
  in flow down <~ combine [constant header, isbn, price, constant btnGroup, previewArea]
