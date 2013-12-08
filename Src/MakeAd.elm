module MakeAd where

import Window
import Components.UserInput   as Inputs
import Components.LivePreview as Pre
import Utils.Rest             as Rest
import Utils.Layout           as Layout

isbnPreview = Rest.stringToRecord <~ (Rest.prettyPrint <~ (Rest.singleGet <| Pre.isbnUrl <~ (.isbn Inputs.presentRec)))

adRecord = { user        = ""
           , adType      = ""
           , expTime     = ""
           , price       = ""
           , title       = ""
           , isbn10      = ""
           , isbn13      = ""
           , imageUrl    = ""
           , description = ""
           , condition   = ""
           , lat         = ""
           , lon         = "" }

presentAdRecord = 
  { adRecord | user     <- (lift id (Rest.helloUser))
             , adType   <- (lift id (.butn Inputs.presentRec)) 
             , expTime  <- (lift id (.expire Inputs.presentRec))
             , price    <- (lift id (.price Inputs.presentRec))
             , isbn10   <- (recordExtractor .isbn10)
             , isbn13   <- (recordExtractor .isbn13)
             , imageUrl <- (recordExtractor .imageUrl)
             , description <- (recordExtractor .description) }

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
               
recordExtractor fld = 
  let unrec r = case r of
    Nothing -> ""
    Just a  -> fld a
  in unrec <~ isbnPreview

display w maker preview dat =
  let previewTitle  = Layout.headerGen 300 28 darkOrange "Cover Preview"
      underLine     = spacer 300 2 |> color darkOrange
      previewSide a = flow down [ previewTitle, underLine, a ]
      h             = 400 + (sum <| map heightOf [ previewTitle, underLine ])
      bumper        = spacer 10 10
  in container w h middle <| flow right [ maker, bumper, previewSide <| image 300 400 preview, asText dat ] 

main = display <~ Window.width ~ Inputs.adMaker ~ (recordExtractor .imageUrl) ~ presentAdRecord.price
