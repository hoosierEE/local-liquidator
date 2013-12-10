module Utils.UserInput  where

import Graphics.Input as Input
import Utils.Valid as Valid
import Utils.Layout as Layout
import JavaScript as JS

--Interface with external JavaScript (geolocation)
foreign import jsevent "latitude" (JS.fromFloat 38.8)
  lats : Signal JS.JSNumber
foreign import jsevent "longitude" (JS.fromFloat -80.7)
  lons : Signal JS.JSNumber

-- Inputs
(isbnField  , isbnSignal  ) = Input.field "ISBN Number"
(priceField , priceSignal ) = Input.field "Price"
(expireField, expireSignal) = Input.field "Expire (Minutes)"
buyBtn          = Layout.buttonGen "buy"
sellBtn         = Layout.buttonGen "sell" 
buySell         = Layout.butn

-- Outputs
validSigRecord  = { isbn="", price="", expire="", butn="", lat="", lon="" }
whatsNew rec    = { rec | isbn   <- (lift Valid.isbn   isbnSignal)
                        , price  <- (lift Valid.price  priceSignal)
                        , expire <- (lift Valid.expire expireSignal)
                        , butn   <- (lift Valid.butn   buySell.events) 
                        , lat    <- (lift Valid.latLon lats) 
                        , lon    <- (lift Valid.latLon lons) }
presentRec      = whatsNew validSigRecord

validSignals    = [ (Valid.isbn   <~ isbnSignal)
                  , (Valid.price  <~ priceSignal)
                  , (Valid.expire <~ expireSignal) 
                  , (Valid.butn   <~ buySell.events) ]

-- Display
preview         = combine <| map (\n->lift plainText n) validSignals
adMaker         =
  let
    ins         = combine [ isbnField, priceField, expireField ]
    btns        = constant <| flow right [buyBtn, sellBtn]
    inputHeader = Layout.heads "Create Ad"
    outHeader   = Layout.heads "Preview"
    inputArea   = tableS <~ ins
    previewArea = tableS <~ preview
  in flombine [ inputHeader, inputArea, btns, outHeader, previewArea ]
    
-- Basic Helpers
flombine        = (\n-> flow down <~ combine n)
tableS          = let inputTitles = [ "Isbn", "Price ($)", "Minutes" ] in Layout.table inputTitles
