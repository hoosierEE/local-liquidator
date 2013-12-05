module MakeAd where

import Components.UserInput as Inputs
import Components.LivePreview as Pre
import Utils.Rest as Rest


display maker preview = flow right [ maker, asText preview ]

isbnPreview = Rest.stringToRecord <~ (Rest.prettyPrint <~ (Rest.singleGet <| Pre.isbnUrl <~ (.isbn Inputs.presentRec)))

main = display <~ Inputs.adMaker ~ isbnPreview

-- debugging
-- isbnPreview = Pre.isbnUrl <~ (.isbn Inputs.presentRec)
