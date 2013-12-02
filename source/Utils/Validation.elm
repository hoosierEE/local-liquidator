module Utils.Validation (validate, btnClicked) where
import String
import Char

-- Input Valication Logic

validate : String -> Bool -> String
validate x isIsbn = case isIsbn of
  -- hack "0" around the "show own html" issue
  True -> if (String.all Char.isDigit x && (String.length x == 10 || String.length x == 13)) then x else ""
  False -> case (String.toFloat x) of
    Nothing -> ""
    Just x -> show x

btnClicked : Signal () -> Signal Bool
btnClicked btnPress = let always value signal = lift (\_ -> value) signal
  in merge (always False (delay 0 btnPress)) (always True btnPress)
