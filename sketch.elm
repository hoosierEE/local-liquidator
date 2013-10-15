import Window
import Graphics.Input as Input

{-
visual elements of our app:
 title/tagline (always at top)
 listBar [addBox, list]
 map
 otherStuff

When in landscape mode we want to see the listBar on the left and small,
 and [map, otherStuff] on the right and larger.
In portrait mode we want to see the map full-width,
 but some area at the bottom to see the listBar's top,
 then the rest of the listBar,
 and finally the otherStuff
-}

content (w,h) = let
  w' = (\n m-> round <| (toFloat n) * m) w 0.75 -- 75% screen width
  w'' = w - w'  -- 25% screen width
  h' = round <| (toFloat h) * 0.75
  ratio a b name = asText <| name ++ " width:height = " ++ show (toFloat (a) / toFloat(b))
  mapBox wid hei = color green <| container wid hei middle <| ratio wid hei "map" --rectangle
  listBar wid = flow down [
    color teal <| container wid 100 middle <| plainText "add item",
    color white <| container wid h midTop <| plainText "list items"] --listAdd, list
  otherStuff wid = color gray <| container wid h' middle <| plainText "other stuff"
  landscape = flow right [listBar w'', flow down [mapBox w' h, otherStuff w']]
  portrait = flow down [mapBox w h', flow right [listBar w'', otherStuff w']]
 in 
  if w' > h then landscape else portrait

main = content <~ Window.dimensions
