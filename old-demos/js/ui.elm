-- Refactored - much easier to read.
import Graphics.Input as G
import Window as W
import Keyboard as K


rec = {title = "Book Title", isbn = "ISBN Number"}


(txbox,content) = 
  let 
    currentText = rec.title
  in G.field currentText

(btn,evt) =
  let coolbtn shp clr =
    color blue <| collage 80 38 [
    rotate (pi/2) <| move (25,0) <| filled clr (ngon shp 12)
    , move (-15, 0) <| toForm <| plainText "post"]
  in G.customButton
    (coolbtn 6 lightBlue)
    (coolbtn 5 lightBlue)
    (coolbtn 4 lightOrange)

txField t w = size (w`div`2) 38 <| t
results t w = size w 38 <| plainText t 

resultsBar = combiner right [results <~ constant "book" ~ W.width]

inputBar = combiner right [txField <~ txbox ~ W.width, constant btn]

app = combiner down [inputBar, resultsBar]

-- View
layout (w,h) a = 
  let 
    background = fittedImage w h "/texture.jpg"
  in
    flow outward [background, container w (h `div` 2) middle a]


-- helpers
combiner dir = (\n-> flow dir <~ (combine n)) -- "Flow" for signals

main = combiner outward [layout <~ W.dimensions ~ app]
