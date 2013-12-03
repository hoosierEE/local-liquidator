module Utils.Validation (validate, btnClicked) where
import String
import Char

validate : String -> String -> String
validate str inputType = case inputType of
  -- valid isbn10: 10 digits or 9 digits ++ X
  -- valid isbn13: 13 digits
  "isbn"   ->
    let isbnDigits = String.filter Char.isDigit str
    in case String.length isbnDigits of
      9 -> isbnDigits ++ "X"
      10 -> isbnDigits
      13 -> isbnDigits
      _ -> ""
  "price"  -> case (String.toFloat str) of
      Nothing -> ""
      Just str  -> show str
  "expire" -> let defaultTime = "60" in
    case String.toInt str of
      Nothing -> defaultTime -- default expires in 1 hour
      Just str  -> show str

btnClicked : Signal () -> Signal Bool
btnClicked btnPress = let always value signal = lift (\_ -> value) signal
  in merge (always False (delay 0 btnPress)) (always True btnPress)
