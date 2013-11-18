import Window
import Mouse

-- Constants, can be in a separate module and then imported
todoWidth = 500
titleColor = rgb 179 179 179
spacerColor1 = rgb 141 125 119
spacerColor2 = rgb 108 125 119
topBarHeight = 34

header info = flow down [ 
  width todoWidth . centered . Text.color titleColor . Text.height 48 
    <| toText <| info
  , color spacerColor1 (spacer todoWidth 15)
  , color spacerColor2 (spacer todoWidth 1 ) ]


view (w,h) clicks = 
  let 
    viewStyle = if
      | w < 767 -> "phone"
      | w < 979 -> "tablet"
      | w >= 979 -> "desktop"
      | otherwise -> "phone"
    orientation = if w > h then "landscape" else "portrait"
    msg = viewStyle ++ " " ++ orientation ++ ": " ++ show clicks
    --h' = toFloat h - toFloat h * 0.8
    h' = toFloat h / 2 |> round
  in  flow down [
          navs
        , collage w 200 [ (header msg |> toForm) ]
        , collage w h' [toForm <| plainText "hello world"] 
      ]

main = view <~ Window.dimensions ~ merge Window.width (count Mouse.clicks)



navs = flow right <| map navBar paths
navBar (name, href) =
    let words = text . Text.link href <| toText name
    in  container (widthOf words + 20) topBarHeight midRight words
paths =
  [ ("CheckISBN", "http://www.local-liquidator.com/checkISBN.php")
  , ("JSON 1", "http://www.local-liquidator.com/JsonTest.html")
  , ("JSON 2", "http://www.local-liquidator.com/JsonTest/JsonTest.html")
  , ("Home", "/")
  ]
