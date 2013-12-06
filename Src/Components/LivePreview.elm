module Components.LivePreview where
-- Module for pretty-displaying the returned data from Scott's scripts.

isbnUrl : String -> String
isbnUrl isbn = "/php/checkISBN.php?isbn=" ++ isbn


