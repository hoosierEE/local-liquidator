module MakeAd where

import Components.UserInput   as Inputs
import Components.LivePreview as Pre
import Utils.Rest             as Rest

display maker preview = flow right [ maker, asText preview ]

isbnPreview = Rest.stringToRecord <~ (Rest.prettyPrint <~ (Rest.singleGet <| Pre.isbnUrl <~ (.isbn Inputs.presentRec)))

recordExtractor = 
  let vinyl r = case r of
    Nothing -> [""]
    Just a  -> [a.valid, a.description, a.imageURL]
  in vinyl <~ isbnPreview

main = display <~ Inputs.adMaker ~ recordExtractor -- isbnPreview

-- debugging
-- isbnPreview = Pre.isbnUrl <~ (.isbn Inputs.presentRec)
