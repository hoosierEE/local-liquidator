module MakeAd where

import Components.UserInput   as Inputs
import Components.LivePreview as Pre
import Utils.Rest             as Rest

isbnPreview = Rest.stringToRecord <~ (Rest.prettyPrint <~ (Rest.singleGet <| Pre.isbnUrl <~ (.isbn Inputs.presentRec)))

storeAdRecord = { user        = "" 
                , title       = ""
                , isbn10      = ""
                , isbn13      = ""
                , imageUrl    = ""
                , expTime     = ""
                , description = ""
                , condition   = ""
                , price       = ""
                , adType      = ""
                , lat         = ""
                , lon         = "" }
                
adUrl a = let scriptPath = "/php/storeAd.php"
          in  scriptPath ++ "?user="        ++ a.user
                         ++ "&Title="       ++ a.title
                         ++ "&ISBN10="      ++ a.isbn10
                         ++ "&ISBN13="      ++ a.isbn13
                         ++ "&imageURL="    ++ a.imageUrl
                         ++ "&ExpTime="     ++ a.expTime
                         ++ "&Description=" ++ a.description
                         ++ "&Condition="   ++ a.condition
                         ++ "&Price="       ++ a.price
                         ++ "&Adtype="      ++ a.adType
                         ++ "&Lat="         ++ a.lat
                         ++ "&Lon="         ++ a.lon
               
recordExtractor = 
  let unrec r = case r of
    Nothing -> ""
    Just a  -> a.imageURL
  in unrec <~ isbnPreview

display maker preview = flow right [ maker, image 300 400 preview ]
main = display <~ Inputs.adMaker ~ recordExtractor -- isbnPreview
