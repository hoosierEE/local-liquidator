module MakeAd where

import Components.UserInput as Inputs
import Components.LivePreview as Pre
import Utils.Rest as Convert


display maker preview = flow right [ maker, asText preview ]

isbnPreview = Convert.prettyPrint <~ (Convert.singleGet <| Pre.isbnUrl <~ (.isbn Inputs.presentRec))

main = display <~ Inputs.adMaker ~ isbnPreview

-- debugging
-- isbnPreview = Pre.isbnUrl <~ (.isbn Inputs.presentRec)
