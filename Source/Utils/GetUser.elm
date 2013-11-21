module Utils.GetUser (helloUser) where

import Utils.HttpFunctions (prettyPrint, getLogin)

scriptSrc : Signal String
scriptSrc = constant "/php/getUser.php"

-- HTTP control
sendRequest : Signal String
sendRequest = keepWhen (constant True) "" <| scriptSrc

helloUser : Signal String
helloUser = prettyPrint <~ getLogin sendRequest
