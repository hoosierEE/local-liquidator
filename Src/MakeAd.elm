module MakeAd where

import Http
import Components.UserInput as Inputs
import Components.LivePreview as Pre

display a b = flow right [ a, asText b ]

isbnPreview = Http.sendGet (dropRepeats <| Pre.isbnUrl <~ (.isbn Inputs.presentRec))

main = display <~ Inputs.adMaker ~ isbnPreview

-- debugging
-- isbnPreview = Pre.isbnUrl <~ (.isbn Inputs.presentRec)
