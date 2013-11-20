import Http

prettyPrint res = case res of
  Http.Waiting -> plainText ""
  Http.Failure _ _ -> plainText ""
  Http.Success a -> plainText a

getLogin req = Http.send <| lift (\r -> Http.post r "") req

defaultValue = constant "/php/getUser.php"

main = prettyPrint <~ getLogin defaultValue
