module Utils.Rest where

-- Module for doing Http and JSON conversions
import Http
import JavaScript.Experimental as JS
import Json
import Maybe

-- Specialized Http requests
singleGet r = Http.sendGet (dropRepeats r) 

sendReq : Signal String -> Signal (Http.Response String)
sendReq str = Http.send <| (\r -> Http.post r "" ) <~ str

-- Http User Validation
scriptSrc = constant "/php/getUser.php"
helloUser = prettyPrint <~ sendReq scriptSrc

prettyPrint : Http.Response String -> String 
prettyPrint res = case res of
  Http.Waiting     -> ""
  Http.Failure _ _ -> "" -- for debugging
  Http.Success a   -> a 

-- JSON
stringToRecord str = case Json.fromString str of
  Just jsonValue -> Just (JS.toRecord (Json.toJSObject jsonValue))
  Nothing -> Nothing

-- URL string -> List of Record accessors -> Signal [String]
stringy : Signal String -> [(a -> String)]-> Signal [String]
stringy req accs = 
  let
    recordToString response =
      case response of
        Http.Success str -> disassemble str
        Http.Waiting     -> ["waiting"]
        Http.Failure _ _ -> [""]
    disassemble str = map (partOf str) accs
    partOf str portion =
      let stringToRecord str = case Json.fromString str of
        Just jsonValue -> Just (JS.toRecord (Json.toJSObject jsonValue))
        Nothing -> Nothing
      in maybe "" portion (stringToRecord str)
  in recordToString <~ (Http.sendGet req)
