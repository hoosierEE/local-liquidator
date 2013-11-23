module Utils.Isbn (isbnString) where

import open Utils.HttpFunctions

scriptSrc : String
scriptSrc = "/php/checkISBN.php?isbn="

queryString : String -> String
queryString str = case str of
  "" -> scriptSrc ++ "0" -- hack to prevent weird default ISBN return value (somebody else's bug?)
  s -> scriptSrc ++ s

isbnString : Signal String -> Signal String
isbnString str = prettyPrint <~ sendReq (dropRepeats (queryString <~ str)) "get" 
