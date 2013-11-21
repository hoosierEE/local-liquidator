module Utils.Isbn (isbnString) where

import Utils.HttpFunctions (prettyPrint, responses)

isbnString : Signal String -> Signal String
isbnString str = prettyPrint <~ responses (dropRepeats str)
