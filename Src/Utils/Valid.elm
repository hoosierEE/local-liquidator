module Utils.Valid where
import String
import Char
import Maybe

isbn : String -> String
isbn str =
  let isbnDigits = (String.filter Char.isDigit str)
      len = (String.length isbnDigits)
  in if | len == 9 -> isbnDigits ++ "X"
        | (len == 10) || (len == 13) -> isbnDigits
        | otherwise -> ""

price : String -> String
price str = case (String.toFloat str) of
    Nothing  -> "0"
    Just str -> let currency s = toFloat (round (s * 100)) / 100
                in show (currency str)

expire : String -> String
expire str =
  let defaultTime = "60" -- one hour
      maxTime = "10080" -- two weeks
  in case String.toInt str of
      Nothing  -> defaultTime -- default ad lasts 1 hour
      Just str ->
        if | (str >= 0) && (str <= 10080) -> show str
           | str > 10080 -> maxTime
           | otherwise -> defaultTime

butn : String -> String
butn btnName = btnName
