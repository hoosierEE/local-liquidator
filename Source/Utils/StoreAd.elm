import Json
import JavaScript.Experimental as JS
import Http
import Graphics.Input as Input

-- data
(butn, press) = Input.button "Store Ad" 
url =  "/php/storeAd.php?"
    ++ "Title" ++ "someRandomBook"
    ++ "&ISBN10" ++ "1234567890" 
    ++ "&ISBN13" ++ "123456789abc"
    ++ "&imageURL" ++ "someImgUrl"
    ++ "&ExpTime" ++ "10"
    ++ "&Description" ++ "Short"
    ++ "&Condition" ++ "new"
    ++ "&Price" ++ "12.42"
    ++ "&user" ++ "ashroyer"
    ++ "&Adtype" ++ "seller"
    ++ "&Lat" ++ "1" ++ "&Lon" ++ "2"

adRecord =
  { title = "book title"
  , isbn10 = 1234567890
  , isbn13 = 1234567890123
  , imageUrl = "http://site.domain/path/file.img"
  , expTime = 10080
  , description = "string description, could be quite long" 
  , condition = "fair"
  , price = 12.42
  , user = "username"
  , adType = True 
  , lat = 48.8284284
  , lon = 52.8248294
  }

jsObject = Json.toJSString "" (Json.fromJSObject <| JS.fromRecord adRecord)

-- button control
isClicked evt = 
  let always value signal = lift (\_->value) signal
  in merge (always False (delay 0 evt)) (always True evt)
sendable = isClicked press

-- http control
sendRequest   = keepWhen sendable "0" <| constant url
getLogin req  = Http.send <| lift (\r -> Http.post r "") req
loginResponse = lift prettyPrint (getLogin sendRequest)

-- format the returned data 
prettyPrint res = case res of
  Http.Waiting     -> plainText "waiting"
  Http.Failure _ _ -> plainText ""
  Http.Success a   -> plainText a

-- display
note = width 400 . plainText <| "click to post the following JSON object to /php/storeAd.php"
elems = flow right [butn, note]
previewRecord = width 600 <| plainText ("Elm Record: \n" ++ show adRecord) 
previewJSObject = asText jsObject

main = flow down <~ combine [constant elems, constant previewRecord, loginResponse]
