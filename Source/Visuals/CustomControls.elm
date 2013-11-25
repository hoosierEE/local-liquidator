module Visuals.CustomControls (btnBuilder) where

import Graphics.Input as Input

-- Create a button with the given text
btnBuilder : String -> (Element, Signal ())
btnBuilder a = Input.customButton (butn 6 lightBlue a) (butn 5 lightRed a) (butn 4 lightOrange a)

-- Define button inactive/hover/click elements
butn : Int -> Color -> String -> Element
butn shp clr label = collage 98 48
  [ rotate (pi/2) <| move (0,0) <| filled clr (ngon shp 20)
  , move (0,0) <| toForm <| plainText label
  ] |> color darkBlue 
