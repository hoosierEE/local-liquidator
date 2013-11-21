module Header (header) where
import Window
import Utils.GetUser (helloUser)

-- Constants
topBarHeight = 20
minLogoHeight = 30

-- Visuals
headerBuilder : (Int,Int) -> String -> Element
headerBuilder (w,h) login =
  let title = width w . centered . Text.height (maximum [minLogoHeight, (toFloat w / 20)]) <| toText "Local Liquidator"
      welcome = case login of
        "404" -> plainText "not logged in (404 error)"
        "guest" -> plainText "welcome Guest"
        a -> plainText a
  in flow down 
    [ title
    , flow right [navs, welcome]
    ] |> color lightBlue

navs : Element
navs = flow right <| map navBar paths

navBar : (String,String) -> Element
navBar (name, href) =
  let words = 
    flow right [ spacer 10 10 
        , (text . Text.link href <| toText name)
        , spacer 10 10 ]
  in 
    container (widthOf words) topBarHeight midRight words

paths : [(String,String)]
paths =
  [ ("Home", "/")
  , ("Login", "/php/php_cas.php")
  , ("Logout", "/php/cas_logout.php")
  ]

header : Signal Element
header = headerBuilder <~ Window.dimensions ~ helloUser
