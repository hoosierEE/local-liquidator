import Window
import Graphics.Input as Input

(field,typedText) = Input.field "type here"



content (w,h) f tx = let
  w' = (\n m-> round <| (toFloat n) * m) w 0.75 -- 75% screen width
  w'' = w - w'  -- 25% screen width
  h' = round <| (toFloat h) * 0.75
  
  results = 
    let parseString x = case x of
        [] -> show "Your Ad Content"
        _ -> show x
    in parseString tx
    
  mapBox wid hei = color green <| container wid hei middle <| plainText "map"
  listBar wid = flow down [
    color blue <| container wid 50 middle <| plainText "add item area"
    , f
    , plainText results
    , color white <| container wid h midTop <| plainText "list items area"]
  otherStuff wid = color gray <| container wid h' middle <| plainText "other stuff goes here"
  
  -- different visual modes:
  landscape = flow right [listBar w'', flow down [mapBox w' h, otherStuff w']]
  portrait = flow down [mapBox w h', flow right [listBar w'', otherStuff w']]
  -- everything:
  header = color red <| width w <| [markdown|
<h1 style="font-family:Times, serif;text-align:center;">Local Liquidator</style>
<h3 style="text-align:center;">Tagline</style>
|]
  rest = if w' > h then landscape else portrait

 in 
  flow down [header, rest]

main = content <~ Window.dimensions ~ field ~ typedText
