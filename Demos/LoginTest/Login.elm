import Graphics.Input as Input
import Http
import String
import Window

getErrors : String -> String -> String -> String -> [String]
getErrors first last email remail =
  justs <| map (\(err,msg) -> if err then Just msg else Nothing)
    [ (first == ""    , "First name required.")
    , (last == ""     , "Last name required.")
    , (email == ""    , "Must enter your email address.")
    , (remail == ""   , "Must re-enter your email address.")
    , (email /= remail, "Email addresses do not match.")
    ]

url : String -> String -> String -> String
url first last email = "/php/getUser.php"

-- Signals
(firstBox , first)  = Input.field "First Name"
(lastBox  , last)   = Input.field "Last Name"
(emailBox , email)  = Input.field "Your Email"
(remailBox, remail) = Input.field "Re-enter Email"
(butn     , press)  = Input.button "Submit"

sendAttempt : Signal Bool
sendAttempt = lift (\c -> c > 0) (count press)

always value signal = lift (\_ -> value) signal
isClicked = merge (always False (delay 0 press)) (always True press)

errors : Signal [String]
errors = keepWhen sendAttempt []
                  (lift4 getErrors first last email remail)

sendable : Signal Bool
sendable = lift2 (&&) isClicked (lift isEmpty errors)

-- Display
fieldWith : String -> Element -> Element
fieldWith txt fld =
  flow right
    [ container 200 32 midRight <| plainText txt
    , container 200 32 middle <| size 180 26 fld ]

showErrors : [String] -> Element
showErrors errs =
  if isEmpty errs then spacer 10 10 else
    flow down <| map (text . Text.color red . toText) errs

formTitle : String -> Element
formTitle str = width 400 . centered . Text.height 38 <| toText str

userEntry : Element -> Element -> Element -> Element -> [String] -> Element
userEntry first last email remail errors =
  color (rgb 230 230 230) . flow down <|
    [ formTitle "Example Form"
    , fieldWith "First Name:" first
    , fieldWith "Last Name:"  last
    , fieldWith "Your Email:" email
    , fieldWith "Re-enter Email:" remail
    , showErrors errors
    , container 390 50 midRight <| size 60 30 butn
    ]

-- HTTP control
sendRequest : Signal String
sendRequest = keepWhen sendable "" <| lift3 url first last email

getLogin : Signal String -> Signal (Http.Response String)
getLogin req = Http.send <| lift (\r -> Http.post r "") req

-- HTTP printing  
prettyPrint : Http.Response String -> Element
prettyPrint res = case res of
  Http.Waiting -> plainText ""
  Http.Failure _ _ -> plainText ""
  Http.Success a -> plainText a

inputForm = lift5 userEntry firstBox lastBox emailBox remailBox errors

inputBox = 
  let
    cmaker inForm bWidth bHeight = container bWidth bHeight topLeft inForm
    w = lift widthOf inputForm
    h = lift heightOf inputForm
  in 
    lift3 cmaker inputForm w h
    
loginResponse = lift prettyPrint (getLogin sendRequest)

scene (w,h) box result =
  flow down 
    [ spacer w 50
    , container w ((heightOf box)) midTop box
    , container w (h - heightOf box) midTop result
    ]

main : Signal Element
main = lift3 scene Window.dimensions inputBox loginResponse
