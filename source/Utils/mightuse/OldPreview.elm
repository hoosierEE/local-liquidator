module Utils.Preview (preview) where 

import Http
import Maybe
import Json
import JavaScript.Experimental as JS

-- Module : String -> Element
-- takes an Http.request string, parses the (JSON) response into a Record
-- and finally displays certain bits of the record in an Element.

preview req = display <~ (responses req)

responses : Signal String -> Signal (Http.Response String)
responses req = Http.sendGet req 

display : Http.Response String -> Element
display response =
  case response of
    Http.Success str -> formatify str 
    Http.Waiting     -> plainText "waiting"
    Http.Failure _ _ -> plainText  "" 

-- Better idea!  Make two [Element] columns, *then* flow right [a, b] |> flow down
headings : [String]
headings =
  [ "Title"
  , "Description"
  , "Valid" ]

accessors =
  [ .title
  , .description ]

formatify : String -> Element
formatify str =
  let row (a,b) = flow right 
                [ width 100 <| plainText a
                , width 300 <| plainText <| show b ]
      myFunc s = map (\n-> partOf s n) accessors
  in flow down <| map row (zip headings (myFunc str))

-- takes an Http.response and a field accessor, returns (maybe) that field's data
partOf : String -> (a -> String) -> String
partOf str portion =
  let stringToRecord str = case Json.fromString str of
    Just jsonValue -> Just (JS.toRecord (Json.toJSObject jsonValue))
    Nothing -> Nothing
  in maybe "" portion (stringToRecord str)
