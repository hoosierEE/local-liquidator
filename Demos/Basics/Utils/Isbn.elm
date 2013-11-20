module Utils.Isbn (isbnString) where
import Http
import Maybe

scriptSrc : String
scriptSrc = "/php/checkISBN.php?isbn="

prettyPrint : Http.Response String -> String 
prettyPrint res = case res of
  Http.Waiting     -> ""
  Http.Failure _ _ -> "404" -- for debugging
  Http.Success a   -> a 

responses : Signal String -> Signal (Http.Response String)
responses s = Http.sendGet (queryString <~ s)

queryString : String -> String
queryString str = scriptSrc ++ str

isbnString : Signal String -> Signal String
isbnString str = prettyPrint <~ responses (dropRepeats str)
