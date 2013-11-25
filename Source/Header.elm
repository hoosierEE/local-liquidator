module Header (header) where
import Window
import Utils.HttpFunctions (sendReq, prettyPrint)

scriptSrc : Signal String
scriptSrc = constant "/php/getUser.php"
helloUser : Signal String
helloUser = prettyPrint <~ sendReq scriptSrc "post"

-- Constants
topBarHeight = 20
minLogoHeight = 30

-- Visuals
headerBuilder : (Int,Int) -> String -> Element
headerBuilder (w,h) login =
  let title = width w . centered . Text.height (maximum [minLogoHeight, (toFloat w / 20)]) <| toText "Local Liquidator"
      welcome = case login of
        "404" -> plainText "not logged in (404 error)"
        "guest" -> plainText "Welcome Guest"
        a -> plainText ("Welcome, " ++ a)
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
  , ("Send Ad (test)", "/storeAdTest.html")
  , ("Add User (test)", "/addUserTest.html")
  ]

header : Signal Element
header = headerBuilder <~ Window.dimensions ~ helloUser
