module Components.UserInput (scene,validSignals) where

import Graphics.Input as Input
import Utils.Valid as Valid

-- Inputs
(isbnField  , isbnSignal  ) = Input.field "ISBN Number"
(priceField , priceSignal ) = Input.field "Price"
(expireField, expireSignal) = Input.field "Expire Minutes"
(buyBtn     , buySignal   ) = Input.button "Buy"
(sellBtn    , sellSignal  ) = Input.button "Sell"
-- Outputs
validSignals = [ (Valid.isbn   <~ isbnSignal)
               , (Valid.price  <~ priceSignal)
               , (Valid.expire <~ expireSignal) ]
-- Display
inputHeadings =          [ "Isbn", "Price", "Minutes" ]
ins           = combine  [ isbnField, priceField, expireField ]
btns          = constant <| flow right [buyBtn, sellBtn]
preview       = combine  <| map (\n->lift plainText n) validSignals
table a b     =
  let leftSide            = map (\n-> container 90 38 midRight <| plainText n) a
      rightSide           = map (\n-> container 100 38 midLeft <| width 100 n)
      padding             = spacer 10 10
      row (title,content) = flow right [ title, padding, content ]
  in flow down <| map row <| zip leftSide (rightSide b)
tableS z = table inputHeadings z

scene = flow down <~ combine [ tableS <~ ins, btns, tableS <~ preview ]
