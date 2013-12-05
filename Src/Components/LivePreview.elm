module Components.LivePreview where

import Utils.Layout as Layout
import Http

-- Module for pretty-displaying the returned data from Scott's scripts.

isbnUrl isbn = "/php/checkISBN.php?isbn=" ++ isbn
adUrl a = let scriptPath = "/php/storeAd.php"
  in   scriptPath
       ++ "?user=" ++ a.user
       ++ "&Title=" ++ a.title
       ++ "&ISBN10=" ++ a.isbn10
       ++ "&ISBN13=" ++ a.isbn13
       ++ "&imageURL=" ++ a.imageUrl
       ++ "&ExpTime=" ++ a.expTime
       ++ "&Description=" ++ a.description
       ++ "&Condition=" ++ a.condition
       ++ "&Price=" ++ a.price
       ++ "&Adtype=" ++ a.adType
       ++ "&Lat=" ++ a.lat
       ++ "&Lon=" ++ a.lon


sendReq : Signal String -> String -> Signal (Http.Response String)
sendReq str method = case method of
  "get"  -> Http.sendGet str
  "post" -> Http.send    <| (\r -> Http.post r "" ) <~ str

prettyPrint : Http.Response String -> String 
prettyPrint res = case res of
  Http.Waiting     -> ""
  Http.Failure _ _ -> "" -- for debugging
  Http.Success a   -> a 


--usage:
{-
import Utils.HttpFunctions (sendReq, prettyPrint)

scriptSrc : Signal String
scriptSrc = constant "/php/getUser.php"

helloUser : Signal String
helloUser = prettyPrint <~ sendReq scriptSrc "post"
-}
-- uncomment these lines (and comment out the module declaration) to test this code
-- url = constant "/"
-- main = plainText <~ (prettyPrint <~ sendReq url True)
