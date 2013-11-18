module Layout (msg) where

-- Constants
minPhone = 320
minTablet = 640
maxTablet = 1200
whRatio = 1.0

-- Boolean layout functions
phone : Int -> Bool
phone w = w < minPhone

tablet : Int -> Bool
tablet w = w >= minPhone && w < maxTablet

desktop : Int -> Bool
desktop w = w > maxTablet

landscape : (Int,Int) -> Bool
landscape (w,h) = toFloat w / toFloat h > whRatio

-- Display layout "type" as plainText, where "type" is landscape/portrait + phone/tablet etc.
msg : (Int,Int) -> Element 
msg (w,h) =
  let
    viewStyle = if
      | phone w -> "phone"
      | tablet w -> "tablet"
      | desktop w -> "desktop"
      | otherwise -> "desk"
    orientation = if w > h then "landscape" else "portrait"
    message = " Layout: " ++ orientation ++ " " ++ viewStyle ++ " width: " ++ show w
  in plainText message
