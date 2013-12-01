import Utils.Header (hdr)
import Utils.JConvert (stringy)
-- import Utils.Content (box) -- moved to mightuse/
import Utils.Inputs (creator)
-- Module for creating a new ad
-- previews isbn data
-- grabs geolocation data
-- user selects buy/sell
-- all this is turned into an http request to /php/sendAd.php

url = constant "/Utils/JsonTest/isbn.json" -- for debugging


preview : Signal Element
preview = let
    results = stringy url accs
    funcs = [plainText, width 400 . plainText, fittedImage 400 400] 
    accs = [.title, .description, .imageURL]
    caps = map (width 100 . plainText) ["Title", "Description", "Cover"]
    todos str = zipWith (beside) caps (zipWith (<|) funcs str)
  in flow down <~ (todos <~ results)



content : Element -> Element -> Element
content a b = flow right [a,b]

main = flow down <~ combine [ hdr, content <~ creator ~ preview ]


