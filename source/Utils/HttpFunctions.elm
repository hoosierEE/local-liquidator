module Utils.HttpFunctions (prettyPrint, sendReq) where

import Http

sendReq : Signal String -> String -> Signal (Http.Response String)
sendReq str method = case method of
  "get"  -> Http.sendGet str
  "post" -> Http.send    <| (\r -> Http.post r "" ) <~ str

prettyPrint : Http.Response String -> String 
prettyPrint res = case res of
  Http.Waiting     -> ""
  Http.Failure _ _ -> "" -- for debugging
  Http.Success a   -> a 


-- uncomment these lines (and comment out the module declaration) to test this code
-- url = constant "/"
-- main = plainText <~ (prettyPrint <~ sendReq url True)