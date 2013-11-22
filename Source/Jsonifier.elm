import Maybe
import Http
import Json
import JavaScript.Experimental as JS

url = "isbn.json"

responses : Signal (Http.Response String)
responses = Http.sendGet <| constant url 

stringToRecord : String -> Maybe String
stringToRecord str = case Json.fromString str of
  Just jsonValue -> Just <| JS.toRecord <| Json.toJSObject jsonValue
  Nothing -> Nothing

-- Convert Http Response (String) into an Element
formatify : String -> Element
formatify a = 
  let x = stringToRecord a
  in case x of
    Nothing -> asText ""
    _ -> asText <| x

-- Display a response.
display response = case response of
  Http.Success a   -> formatify a
  Http.Waiting     -> asText "waiting"
  Http.Failure _ _ -> asText response

main = display <~ responses
