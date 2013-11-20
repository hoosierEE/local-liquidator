import Graphics.Input as Input
import Http
import String

url = "/php/getUser.php"

-- Signals
(butn, press) = Input.button "Login"

sendAttempt : Signal Bool
sendAttempt = lift (\c -> c > 0) (count press)

isClicked : Signal Bool
isClicked = 
  let always value signal = lift (\_ -> value) signal
  in merge (always False (delay 0 press)) (always True press)

sendable = (&&) <~ sendAttempt ~ isClicked

userEntry = flow down <| [size 60 30 butn]

-- HTTP control
sendRequest : Signal String
sendRequest = keepWhen sendable "" <| constant url

getLogin : Signal String -> Signal (Http.Response String)
getLogin req = Http.send <| lift (\r -> Http.post r "") req

-- HTTP printing  
prettyPrint : Http.Response String -> Element
prettyPrint res = case res of
  Http.Waiting -> plainText ""
  Http.Failure _ _ -> plainText ""
  Http.Success a -> plainText a

loginResponse = prettyPrint <~ (getLogin sendRequest)

scene box result sendble =
  flow down [flow right [box, asText sendble], result]

main : Signal Element
main = scene <~ (constant butn) ~ loginResponse ~ sendRequest
