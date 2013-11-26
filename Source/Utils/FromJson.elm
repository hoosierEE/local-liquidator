import Http
import Maybe
import Graphics.Input as Input
import Json
import JavaScript.Experimental as JS

-- Module accepts as arguments: url string, request method.
-- Returns JSON object


main = plainText <~ textResponse 

textResponse = display <~ responses

display : Http.Response String -> String
display response =
  case response of
    Http.Success str -> accessFieldOf str .city
    Http.Waiting -> ""
    Http.Failure _ _ -> ""

accessFieldOf : String -> (a -> String) -> String
accessFieldOf x portion =
  let stringToRecord str = case Json.fromString str of
    Just jsonValue -> Just (JS.toRecord (Json.toJSObject jsonValue))
    Nothing -> Nothing
  in maybe "" portion (stringToRecord x)

responses = Http.sendGet <| constant "http://zip.elevenbasetwo.com/v2/US/12345"
