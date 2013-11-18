module Header (header) where
import Layout as L
import Window

topBarHeight = 50

-- Visuals
header (w,h) =
  let 
    title = width w . centered . Text.height 40 <| toText "Local Liquidator (logo here)"
    layoutMsg = L.msg (w,h) -- currently unused
    headerContent = flow down [title, navs] -- , layoutMsg] -- layoutMsg for debugging purposes only
    h' = heightOf navs + heightOf title
  in container w h' middle headerContent |> color lightBlue

-- Site Navigation
navs = flow right <| map navBar paths
navBar (name, href) =
  let words = text . Text.link href <| toText name
  in container (widthOf words + 20) topBarHeight midRight words
paths =
  [ ("Home", "/")
  , ("CheckISBN", "http://www.local-liquidator.com/php/checkISBN.php")
  , ("JSON 1", "http://www.local-liquidator.com/JsonTest.html")
  , ("JSON 2", "http://www.local-liquidator.com/JsonTest/JsonTest.html")
  , ("Login", "/php/login.html")
  ]
