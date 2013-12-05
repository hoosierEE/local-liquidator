module Components.UserInput  where

import Graphics.Input as Input
import Utils.Valid as Valid
import Utils.Layout as Layout
import Utils.Helpers as Helpers

-- Inputs
(isbnField  , isbnSignal  ) = Input.field "ISBN Number"
(priceField , priceSignal ) = Input.field "Price"
(expireField, expireSignal) = Input.field "Expire (Minutes)"
buyBtn          = link "/Utils/Confirmation.html" <| Helpers.buttonGen "buy"
sellBtn         = link "/Utils/Confirmation.html" <| Helpers.buttonGen "sell" 
buySell         = Helpers.butn

-- Outputs
validSigRecord  = { isbn="", price="", expire="", butn="" }
whatsNew rec    = { rec | isbn   <- (lift Valid.isbn   isbnSignal)
                        , price  <- (lift Valid.price  priceSignal)
                        , expire <- (lift Valid.expire expireSignal)
                        , butn   <- (lift Valid.butn   buySell.events) }

presentRec      = whatsNew validSigRecord

validSignals    = [ (Valid.isbn   <~ isbnSignal)
                  , (Valid.price  <~ priceSignal)
                  , (Valid.expire <~ expireSignal) 
                  , (Valid.butn   <~ buySell.events) ]
preview         = combine <| map (\n->lift plainText n) validSignals

-- Display
adMaker         =
  let
    ins         = combine [ isbnField, priceField, expireField ]
    btns        = constant <| flow right [buyBtn, sellBtn]
    hr          = spacer Layout.makerWidth 2 |> color darkOrange 
    heads str   = constant <| flow down [ Helpers.headerGen 200 28 darkOrange str, hr ] 
    inputHeader = heads "Create Ad"
    outHeader   = heads "Preview"
    inputArea   = tableS <~ ins
    previewArea = tableS <~ preview
  in flombine [ inputHeader, inputArea, btns, outHeader, previewArea ]

    
-- Basic Helpers
flombine        = (\n-> flow down <~ combine n)
tableS          = let inputTitles = [ "Isbn", "Price ($)", "Minutes" ] in Layout.table inputTitles
