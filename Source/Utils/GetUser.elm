module Utils.GetUser (helloUser) where
import Http

{-
  Module for turning getUser.php script into a Signal String
  @return:
    ""
    "404"
    "guest" | String username
-}

scriptSrc : Signal String
scriptSrc = constant "/php/getUser.php"

prettyPrint : Http.Response String -> String 
prettyPrint res = case res of
  Http.Waiting     -> ""
  Http.Failure _ _ -> "404" -- for debugging
  Http.Success a   -> a 

getLogin : Signal String -> Signal (Http.Response String)
getLogin req = Http.send <| lift (\r -> Http.post r "") req

-- HTTP control
sendRequest : Signal String
sendRequest = keepWhen (constant True) "" <| scriptSrc

helloUser : Signal String
helloUser = prettyPrint <~ getLogin sendRequest
