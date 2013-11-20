module Header (header) where
import Window
import GetUser (helloUser)

-- Constants
topBarHeight = 20
minLogoHeight = 30
absoluteUrl = "http://local-liquidator.com"
relativeUrl = "/php/getUser.php"

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
header = header' <~ Window.dimensions ~ helloUser
