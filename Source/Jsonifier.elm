import Maybe
import Http
import Json
import JavaScript.Experimental as JS

url = "isbn.json"
example = { valid = True, name = "George" }

responses : Signal (Http.Response String)
responses = Http.sendGet <| constant url 

-- stringToRecord : String -> Maybe a
stringToRecord str = case Json.fromString str of
  Just jsonValue -> (JS.toRecord (Json.toJSObject jsonValue)).valid
  Nothing -> Nothing

-- Convert Http Response (String) into an Element
formatify : String -> Element
formatify a = 
  let x = stringToRecord a
  in case x of
    Nothing -> asText ""
    _ -> flow down
      [ asText example.name
      , asText x
      ]

-- Display a response.
display response = case response of
  Http.Success a   -> formatify a
  Http.Waiting     -> asText "waiting"
  Http.Failure _ _ -> asText response

main = display <~ responses
