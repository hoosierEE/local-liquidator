module Components.LivePreview where
-- Module for pretty-displaying the returned data from Scott's scripts.

isbnUrl : String -> String
isbnUrl isbn = "/php/checkISBN.php?isbn=" ++ isbn

adUrl a = let scriptPath = "/php/storeAd.php"
          in  scriptPath ++ "?user="        ++ a.user
                         ++ "&Title="       ++ a.title
                         ++ "&ISBN10="      ++ a.isbn10
                         ++ "&ISBN13="      ++ a.isbn13
                         ++ "&imageURL="    ++ a.imageUrl
                         ++ "&ExpTime="     ++ a.expTime
                         ++ "&Description=" ++ a.description
                         ++ "&Condition="   ++ a.condition
                         ++ "&Price="       ++ a.price
                         ++ "&Adtype="      ++ a.adType
                         ++ "&Lat="         ++ a.lat
                         ++ "&Lon="         ++ a.lon

