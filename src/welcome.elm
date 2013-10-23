import Window
import Graphics.Input as Input

(field,typedText) = Input.field "type here"
(buttonA,btnA) = Input.button "Buy"
(buttonB,btnB) = Input.button "Sell"

btnz = flow right [buttonA, buttonB]

content (w,h) textbox tx = let

---- beginning of huge Let statement ----

  w' = maximum <| map widthOf [btnz,textbox] -- width of sidebar
  h' = round <| (toFloat h) * 0.75
  
  md1 = [markdown|
  
<iframe width=400 height=300 src="http://www.local-liquidator.com/map.html">
  <p>Your browser does not support iframes.</p>
</iframe>

|]

  md2 = [markdown|
  
### What

Local Liquidator is a peer-to-peer textbook resale app with
a focus on *truly* local commerce.

### How

Post an ad, your ad will appear to other students using the 
app nearby.  Optional CAS login for IUPUI students.

|]


  results = 
    let parseString x = case x of
        [] -> plainText  "Your Ad Content"
        _ -> plainText x
    in parseString tx
  
  -- oure main 3 visual components --  
  mapBox wid hei = color green <| container wid hei middle <| md1
  listBar wid = flow down [
    color blue <| container wid 30 middle <| plainText "add item area"
    , textbox
    , btnz
    , results
    , plainText "list items area"]
  otherStuff = width (w - w') <| md2
  
  -- different visual modes:
  landscape = flow right [listBar w', flow down [mapBox (w - w') h, otherStuff]]
  portrait = flow down [mapBox w h', flow right [listBar w', otherStuff]]
  -- everything:
  header = color red <| width w <| [markdown|
<h1 style="font-family:Times, serif;text-align:center;">Local Liquidator</style>
<h3 style="text-align:center;">Tagline</style>
|]
  rest = if (w - w') > h then landscape else portrait
  footer = color red <| width w <| [markdown|
<em><center>Footer goes here.</center></em>
  |]
-- end of huge Let statement< ----

 in 
  flow down [header, rest, footer]

-- puny main function which takes in all the signals
main = content <~ Window.dimensions ~ field ~ typedText
