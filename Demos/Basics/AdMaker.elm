module AdMaker (adArea) where

import Graphics.Input as Input
import Char
import Maybe
import String

-- Inputs
(isbn , isbnSignal)  = Input.field "ISBN"
(price, priceSignal) = Input.field "Price"
(buy  , buyEvent)    = btnBuilder "Buy"
(sell , sellEvent)   = btnBuilder "Sell"
-- custom button creation and styles
btnBuilder a = Input.customButton (butn 6 lightBlue a) (butn 5 lightRed a) (butn 4 lightOrange a)
butn shp clr label = collage 98 38
    [ rotate (pi/2) <| move (25,0) <| filled clr (ngon shp 12)
    , move (-15,0) <| toForm <| plainText label
    ] |> color gray

-- Form Valication Logic
validate : String -> Bool -> String
validate x wantIsbn = case wantIsbn of
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
