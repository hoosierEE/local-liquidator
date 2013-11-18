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
  let ph = if phone w then "Phone" else ""
      ta = if tablet w then "Tablet" else ""
      de = if desktop w then "Desktop"else ""
      la = if landscape (w,h) then "Landscape" else "Portrait"
  in plainText <| (" - " ++ la ++ " " ++ ph ++ ta ++ de ++ ", w: " ++ show w ++ ", h: " ++ show h)
