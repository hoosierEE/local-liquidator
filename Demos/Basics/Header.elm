module Header (header) where
import Window
import Http

-- Constants
topBarHeight = 20
minLogoHeight = 30
absoluteUrl = "http://local-liquidator.com"
relativeUrl = "/php/getUser.php"

-- display "welcome back {username} ... logout" or "welcome guest ...login"
sendRequest : Signal String
sendRequest = constant relativeUrl -- alternate: (absoluteUrl ++ relativeUrl)

getLogin : Signal String -> Signal (Http.Response String)
getLogin req = Http.send <| lift (\r -> Http.post r "") req

prettyPrint : Http.Response String -> Element
prettyPrint res = case res of
  Http.Waiting -> plainText ""
  Http.Failure _ _ -> plainText ""
  Http.Success a -> plainText a



-- Visuals
header' (w,h) login =
  let title = width w . centered . Text.height (maximum [minLogoHeight, (toFloat w / 20)]) <| toText "Local Liquidator"
  in flow down [title, navs, login] |> color lightBlue

-- Site Navigation
navs = flow right <| map navBar paths
navBar (name, href) =
  let words = text . Text.link href <| toText name
  in container (widthOf words + 20) topBarHeight midRight words
paths =
  [ ("Home", "/")
  , ("CheckISBN", "http://www.local-liquidator.com/php/checkISBN.php")
  , ("JSON 1", "http://www.local-liquidator.com/JsonTest.html")
  , ("JSON 2", "http://www.local-liquidator.com/JsonTest/JsonTest.html")
  -- , ("Login", "/php/php_cas.php")
  ]

header : Signal Element
header = header' <~ Window.dimensions ~ (prettyPrint <~ (getLogin sendRequest)) 
