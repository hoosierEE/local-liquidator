module Utils.JConvert (stringy) where
{- @param req : the Signal (Http.request String) of the php script to call
  @param accs : a list of record accessors (e.g. [.title, .isbn]) -}
import Http
import Maybe
import Json
import JavaScript.Experimental as JS

stringy : Signal String -> [(a -> String)]-> Signal [String]
stringy req accs = 
  let
    responses req = Http.sendGet req 

    recordToString response =
      case response of
        Http.Success str -> disassemble str
        Http.Waiting     -> ["waiting"]
        Http.Failure _ _ -> [""]

    disassemble str = map (\n-> partOf str n) accs

    partOf str portion =
      let stringToRecord str = case Json.fromString str of
        Just jsonValue -> Just (JS.toRecord (Json.toJSObject jsonValue))
        Nothing -> Nothing
      in maybe "" portion (stringToRecord str)

  in recordToString <~ (responses req)
