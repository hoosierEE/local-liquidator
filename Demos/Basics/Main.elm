import Mouse
import Window
import AdMaker (adArea)
import MapMaker (mapArea)
import Header (header)

mapSize : (Int,Int) -> Int -> Int -> (Int,Int)
mapSize (w,h) w' h' = (w - w', h - h') -- Get Map width and height

mapCoords : Signal (Int,Int)
mapCoords = mapSize <~ Window.dimensions ~ (widthOf <~ adArea) ~ (heightOf <~ (header <~ Window.dimensions)) 

centerOffset : (Int,Int) -> (Int,Int) -> (Float,Float)
centerOffset (x,y) (w,h) = (toFloat x - toFloat w / 2, toFloat h / 2 - toFloat y) 

-- mouseCoords : Signal (Float,Float)
mouseCoords = centerOffset <~ Mouse.position ~ mapCoords

sigFlow dir args = flow dir <~ combine args

main = sigFlow down 
  [ header <~ Window.dimensions
  , sigFlow right [adArea, mapArea <~ mouseCoords ~ mapCoords]
  ]
