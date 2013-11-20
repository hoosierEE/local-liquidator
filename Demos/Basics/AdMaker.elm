module AdMaker (adArea) where

import Graphics.Input as Input
import Char
import Maybe
import String
import Visuals.CustomControls (btnBuilder)
import Utils.Isbn (isbnString)

-- Inputs
(isbn , isbnSignal)  = Input.field "ISBN"
(price, priceSignal) = Input.field "Price"
(buy  , buyEvent)    = btnBuilder "Buy"
(sell , sellEvent)   = btnBuilder "Sell"

-- Form Valication Logic
validate : String -> Bool -> String
validate x isIsbn = case isIsbn of
  True -> if (String.all Char.isDigit x && (String.length x == 10 || String.length x == 13)) then x else ""
  False -> case (String.toFloat x) of
    Nothing -> ""
    Just x -> show x

-- Actually validate the inputs
validIsbn = (\n -> validate n True) <~ isbnSignal
validPrice = (\n -> validate n False) <~ priceSignal 

returnedJsonData : Signal String
returnedJsonData = isbnString validIsbn

-- Visuals
btnGroup : Element
btnGroup = flow right [buy, spacer 4 4, sell]

preview : String -> String -> String -> Element
preview isbn price returnedJson =
  let
    elems = map plainText
      [ "ISBN Number: "
      , isbn
      , "Price: $"
      , price
      , "Description: "
      , returnedJson
      ]
    previewTitle = redTitle "Ad Preview"
    arranger [a,b,c,d,e,f] = flow down [ flow right [a,b], flow right [c,d],e,f ]
  in 
    flow down [ previewTitle, arranger elems ]

previewArea : Signal Element
previewArea = preview <~ validIsbn ~ validPrice ~ returnedJsonData

-- User Entry and Preview (large block Element)
adArea : Signal Element
adArea = let header = redTitle "Ad Creator"
  in flow down <~ combine [constant header, isbn, price, constant btnGroup, previewArea]

-- Helper Functions
redTitle : String -> Element
redTitle str = width 200 . centered . Text.height 20 . Text.color darkRed <| toText str

isClicked : Signal () -> Signal Bool -- True immediately after button is clicked
isClicked evt =
  let always value signal = lift (\_ -> value) signal
  in merge (always False (delay 0 evt)) (always True evt)
