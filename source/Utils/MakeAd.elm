import Utils.Header (hdr)
import Utils.JConvert (stringy)
import Utils.Inputs (controls, urlString)
-- Module for creating a new ad
-- previews isbn data
-- grabs geolocation data
-- user selects buy/sell
-- all this is turned into an http request to /php/sendAd.php

-- url = constant "/Utils/JsonTest/isbn.json" -- for debugging

preview : Signal String -> Signal Element
preview url = let
    -- Logic
    results = stringy url accs
    funcs = [plainText, width 400 . plainText, fittedImage 400 400] 
    accs = [.title, .description, .imageURL]
    -- Display
    todos str = zipWith (beside) caps (zipWith (<|) funcs str)
    title = width 500 . centered . Text.height 20 . Text.color darkYellow <| toText "Ad Preview"
    caps = map (width 100 . plainText) ["Title", "Description", "Cover"]
    scene sig = flow down [title, flow down sig]
  in scene <~ (todos <~ results)

content : Element -> Element -> Element
content a b = flow right [a, spacer 10 10, b]

main = flow down <~ combine [ hdr, content <~ controls ~ (preview urlString) ]

-- OOPS!  sends entire Record instead of ISBN!!!!
