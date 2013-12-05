module MakeAd where

import Components.UserInput as Inputs
import Components.LivePreview as Pre

isbnPreview = Pre.isbnUrl <~ (head Inputs.validSignals)

main = display <~ Inputs.adMaker ~ wholeList -- isbnPreview



-- debugging
display a b = flow right [ a, asText b ]
wholeList = combine Inputs.validSignals
