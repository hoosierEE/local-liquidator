import Http

getLogin req = Http.send <| lift (\r -> Http.post r "") req

prettyPrint res = case res of
  Http.Waiting -> plainText ""
  Http.Failure _ _ -> plainText ""
  Http.Success a -> plainText a

defaultValue = constant ""

main = prettyPrint <~ getLogin defaultValue
