import Http
import Graphics.Input as Input

-- data
(butn, press) = Input.button "Store Ad" 
url = "/php/storeAd.php?"
  ++ "Title=someRandomBook"
  ++ "&ISBN10=1234567890" 
  ++ "&ISBN13=123456789abc"
  ++ "&imageURL=someImgUrl"
  ++ "&ExpTime=later"
  ++ "&Description=Short"
  ++ "&Condition=new"
  ++ "&Price=12.42"
  ++ "&user=ashroyer"
  ++ "&Adtype=seller"
  ++ "&Lat=1&Lon=2" 

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
note = width 400 . plainText <| "click to post the URL to " ++ url 
elems = flow right [butn, note]

main = flow down <~ combine [constant elems, loginResponse]
