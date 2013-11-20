module Utils.GetUser (helloUser) where

{- module simply posts {username} or {guest} as an elemnet -}

import Http
prettyPrint res = case res of
  Http.Waiting -> plainText ""
  Http.Failure _  _ -> plainText ""
  Http.Success a -> plainText ("Welcome, " ++ a)

getLogin req = Http.send <| lift (\r -> Http.post r "") req

defaultValue = constant "/php/getUser.php"

-- HTTP control
sendRequest : Signal String
sendRequest = keepWhen (constant True) "" <| defaultValue

helloUser : Signal Element
helloUser = prettyPrint <~ getLogin sendRequest 
