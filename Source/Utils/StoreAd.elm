import Http
import Graphics.Input as Input

(butn, press) = Input.button "Store Ad"

url title isbn10 isbn13 = 
  "/php/storeAd.php?Title=" ++ title ++ 
  "&ISBN10=" ++ isbn10 ++
  "&ISBN13=" ++ isbn13

isClicked evt = let always value signal = lift (\_->value) signal
  in merge (always False (delay 0 evt)) (always True evt)

sendable = isClicked press

sendRequest = keepWhen sendable "0" <| lift3 url (constant "randomBookTitle") (constant  "1234123412") (constant "1234123412341")

getLogin req = Http.send <| lift (\r -> Http.post r "") req

prettyPrint res = case res of
  Http.Waiting -> plainText "waiting"
  Http.Failure _ _ -> plainText "aw dang, 404"
  Http.Success a -> plainText a

loginResponse = lift prettyPrint (getLogin sendRequest)
note = plainText <| 
  """ click to Http.post the url "/php/storeAd.php?Title=randomBookTitle&ISBN10=1234567890" """
elems = flow right [butn, note]
main = flow down <~ combine [constant elems, loginResponse]
