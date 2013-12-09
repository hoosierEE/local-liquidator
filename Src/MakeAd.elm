module MakeAd where

import Window
import Components.UserInput   as Inputs
import Utils.Rest             as Rest
import Utils.Layout           as Layout

isbnUrl : String -> String
isbnUrl s = "/php/checkISBN.php?isbn=" ++ s

theButton = (.butn Inputs.presentRec)
user = Rest.helloUser
userPlusButtons = [theButton, user]

isbnPreview = Rest.stringToRecord <~ (Rest.prettyPrint <~ (Rest.singleGet <| isbnUrl <~ (.isbn Inputs.presentRec)))

-- ajaxRecord = { 

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

display w maker preview btn =
  let previewTitle  = Layout.headerGen 300 28 darkOrange "Cover Preview"
      underLine     = spacer 300 2 |> color darkOrange
      previewSide a = flow down [ previewTitle, underLine, a, asText btn ]
      bumper        = spacer 10 10
      stuffing      = [ maker, bumper, previewSide <| image 300 400 preview ] 
      h             = maximum <| map heightOf stuffing
  in container w h middle <| flow right stuffing

main = display <~ Window.width ~ Inputs.adMaker ~ (recordExtractor .imageUrl) ~ (combine userPlusButtons)
