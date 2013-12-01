import Maybe
import Http
import Json
import JavaScript.Experimental as JS

url = "isbn.json"
example = { valid = True, name = "George" }

responses : Signal (Http.Response String)
responses = Http.sendGet <| constant url 

-- Display a response.
display response = case response of
  Http.Success a   -> accessFieldOf a
  Http.Waiting     -> asText "waiting"
  Http.Failure _ _ -> asText response

-- Convert Http Response (String) into an Element
accessFieldOf record field = 
  let stringToRecord str = case Json.fromString str of
    Just jsonValue -> Just (JS.toRecord (Json.toJSObject jsonValue))
    Nothing -> Nothing
  in asText <| maybe "" portion (stringToRecord x)

main = display <~ responses

-- helpers
stringToRecord str = case Json.fromString str of
  Just jsonValue -> Just (JS.toRecord (Json.toJSObject jsonValue))
  Nothing -> Nothing
