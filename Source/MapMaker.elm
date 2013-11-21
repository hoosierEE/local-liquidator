module MapMaker (mapArea) where

mapArea : (Float,Float) -> (Int,Int) -> Element
mapArea (x,y) (w,h) = color lightGreen <| collage w h 
    [ ngon 5 20 |> filled darkBlue |> move (x,y)
    , plainText "Map Goes Here" |> toForm |> rotate (atan2 y x) 
    ]
