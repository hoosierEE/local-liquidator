module Visuals.CustomControls (btnBuilder) where
import Graphics.Input as Input

-- custom button creation and styles
btnBuilder a = Input.customButton (butn 6 lightBlue a) (butn 5 lightRed a) (butn 4 lightOrange a)
butn shp clr label = collage 98 38
    [ rotate (pi/2) <| move (25,0) <| filled clr (ngon shp 12)
    , move (-15,0) <| toForm <| plainText label
    ] |> color gray
