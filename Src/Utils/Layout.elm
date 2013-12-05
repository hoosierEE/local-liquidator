module Utils.Layout where
{- This module is almost exclusively about the look and feel of the site -}
import Graphics.Input (customButtons)

-- Layout Constants for Easy Tweaking
makerWidth      = 280
halfWidth       = makerWidth `div` 2
leftWidth       = makerWidth `div` 3 - borderWidth `div` 2
rightWidth      = makerWidth - leftWidth - borderWidth
borderWidth     = maximum [makerWidth `div` 20, 10]

-- Elements
padding         = spacer borderWidth borderWidth 
hr              = spacer makerWidth 2 |> color darkOrange 
heads str       = constant <| flow down [ headerGen makerWidth 28 darkOrange str, hr ] 

-- Arrangement
table a b       =
  let
    leftSide            = map (\n-> container leftWidth 38 midRight <| plainText n) a
    rightSide           = map (\n-> container rightWidth 38 midLeft <| width (rightWidth - 2) n) b
    row (title,content) = flow right [ title, padding, content ]
  in color (rgba 255 199 0 0.2) <| flow down <| map row <| zip leftSide rightSide

-- All-purpose Header
headerGen w h c = width w . centered . Text.height h . Text.color c . toText

-- Custom Button Builder
butn = customButtons ""
buttonGen str =
  let
    box c1 c2 =
      let
        word     = width halfWidth . centered . Text.color darkRed . Text.height 20 . toText <| str
        grad     = linear (0,29) (0,-29) [ (0,c1),(1,c2) ]
        emptyBtn = gradient grad <| rect (toFloat halfWidth - 2) 36
      in collage halfWidth 38 [ emptyBtn, toForm word ]
  in butn.customButton str (box white lightOrange)
                           (box white darkOrange )
                           (box red   lightOrange)

