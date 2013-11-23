module Utils.HttpFunctions (prettyPrint, sendReq) where

import Http

-- @functions: sendReq, prettyPrint

-- True for GET, false for POST
sendReq : Signal String -> String -> Signal (Http.Response String)
sendReq str method = case method of
  "get"  -> Http.sendGet <| str
  "post" -> Http.send    <| (\r -> Http.post r "" ) <~ str

prettyPrint : Http.Response String -> String 
prettyPrint res = case res of
  Http.Waiting     -> ""
  Http.Failure _ _ -> "404" -- for debugging
  Http.Success a   -> a 

-- uncomment these lines to test this code
-- url = constant "/"
-- main = plainText <~ (prettyPrint <~ sendReq url True)
