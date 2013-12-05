module Utils.Layout where

-- Layout Constants for Easy Tweaking
makerWidth      = 200
halfWidth       = makerWidth `div` 2
leftWidth       = makerWidth `div` 3 - borderWidth `div` 2
rightWidth      = makerWidth - leftWidth - borderWidth
borderWidth     = maximum [makerWidth `div` 20, 10]
padding         = let p = borderWidth in spacer p p

table a b       =
  let
    leftSide            = map (\n-> container leftWidth 38 midRight <| plainText n) a
    rightSide           = map (\n-> container rightWidth 38 midLeft <| width (rightWidth - 2) n) b
    row (title,content) = flow right [ title, padding, content ]
  in color (rgba 255 199 0 0.2) <| flow down <| map row <| zip leftSide rightSide
