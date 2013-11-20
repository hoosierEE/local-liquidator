module Utils.Isbn (isbnString) where
import Http

{-
  Module for turning /php/checkISBN.php script into a Signal String
-}
scriptSrc : String
scriptSrc = "/php/checkISBN.php"

prettyPrint : Http.Response String -> String 
prettyPrint res = case res of
  Http.Waiting     -> ""
  Http.Failure _ _ -> "404" -- for debugging
  Http.Success a   -> a 

getLogin : Signal String -> Signal (Http.Response String)
getLogin req = Http.send <| lift (\r -> Http.post r "") req

-- HTTP control
sendRequest : Signal String
sendRequest = keepWhen (constant True) "" <| constant scriptSrc

helloUser : Signal String
helloUser = prettyPrint <~ getLogin sendRequest

queryString : String -> String
queryString str = scriptSrc ++ str
isbnString = 10
-- isbnString str = prettyPrint <~ (getLogin <~ queryString str)
