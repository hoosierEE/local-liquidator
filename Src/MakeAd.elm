module MakeAd where

import Window
import Components.UserInput   as Inputs
import Utils.Rest             as Rest
import Utils.Layout           as Layout

isbnUrl s = "/php/checkISBN.php?isbn=" ++ s

isbnPreview = Rest.stringToRecord <~ (Rest.prettyPrint <~ (Rest.singleGet <| isbnUrl <~ (.isbn Inputs.presentRec)))

sendable =
  let vbtn a = 
    case a of
      "" -> False
      _  -> True
  in vbtn <~ (.butn Inputs.presentRec)
  
adUrl =
  let
    scriptPath user title isbn10 isbn13 imageUrl expTime description condition price adType lat lon =
      "/php/storeAd.php?user=" ++ user        
            ++ "&Title="       ++ title       
            ++ "&ISBN10="      ++ isbn10      
            ++ "&ISBN13="      ++ isbn13      
            ++ "&imageURL="    ++ imageUrl    
            ++ "&ExpTime="     ++ expTime     
            ++ "&Description=" ++ description 
            ++ "&Condition="   ++ condition   
            ++ "&Price="       ++ price       
            ++ "&Adtype="      ++ adType      
            ++ "&Lat="         ++ lat         
            ++ "&Lon="         ++ lon         
  in (Rest.singleGet <| keepWhen sendable "" <|
        (scriptPath <~ Rest.helloUser ~ (extractor .title) ~ (extractor .isbn10)
        ~ (extractor .isbn13) ~ (extractor .imageUrl) ~ (.expire Inputs.presentRec)
        ~ (extractor .description) ~ (extractor .condition) ~ (.price Inputs.presentRec)
        ~ (.butn Inputs.presentRec) ~ (extractor .lat) ~ (extractor .lon)))
imager =
  let unrec r = case r of
    Nothing -> ""
    Just a  -> a.imageURL
  in unrec <~ isbnPreview

extractor fld = 
  let unrec r = case r of
    Nothing -> ""
    Just a  -> fld a
  in unrec <~ isbnPreview

display w maker preview dbg1 =
  let previewTitle  = Layout.headerGen 300 28 darkOrange "Cover Preview"
      underLine     = spacer 300 2 |> color darkOrange
      previewSide a = flow down [ previewTitle, underLine, a ]
      bumper        = spacer 10 10
      stuffing      = [ maker, bumper, previewSide <| image 300 400 preview ] 
      h             = maximum <| map heightOf stuffing
  in container w h middle <| flow right stuffing

main = display <~ Window.width ~ Inputs.adMaker ~ imager ~ imager

