module Utils.HttpFunctions (prettyPrint, responses, getLogin) where

import Http

scriptSrc : String
scriptSrc = "/php/checkISBN.php?isbn="

queryString : String -> String
queryString str = case str of
  "" -> scriptSrc ++ "0" -- hack to prevent weird default ISBN return value (somebody else's bug?)
  s -> scriptSrc ++ s

prettyPrint : Http.Response String -> String 
prettyPrint res = case res of
  Http.Waiting     -> ""
  Http.Failure _ _ -> "404" -- for debugging
  Http.Success a   -> a 

-- maybe turn responses and getLogin into one function that takes Post/Get as a parameter 
responses : Signal String -> Signal (Http.Response String)
responses s = Http.sendGet (queryString <~ s)

getLogin : Signal String -> Signal (Http.Response String)
getLogin req = Http.send <| lift (\r -> Http.post r "") req
