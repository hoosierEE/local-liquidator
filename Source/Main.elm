import Mouse
import Window
import AdMaker (adArea)
import MapMaker (mapArea)
import Header (header)

-- Element sizes
sideBarWidth = widthOf <~ adArea
headerHeight = heightOf <~ header

mapSize : (Int,Int) -> Int -> Int -> (Int,Int)
mapSize (w,h) w' h' = (w - w', h - h') -- Get Map width and height

mapCoords : Signal (Int,Int)
mapCoords = mapSize <~ Window.dimensions ~ sideBarWidth ~ headerHeight

centerOffset : (Int,Int) -> (Int,Int) -> (Float,Float)
centerOffset (x,y) (a,b) = ((toFloat x - toFloat a / 2), toFloat b / 2 - toFloat y) 

-- mouseCoords : Signal (Float,Float)
mouseCoords = centerOffset <~ Mouse.position ~ mapCoords

sigFlow dir args = flow dir <~ combine args

main = sigFlow down 
  [ header
  , sigFlow right [adArea, mapArea <~ mouseCoords ~ mapCoords]
  ]
