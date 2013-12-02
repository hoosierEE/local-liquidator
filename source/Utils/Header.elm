module Utils.Header (hdr) where

import Window
import Utils.HttpFunctions (sendReq, prettyPrint)

scriptSrc : Signal String
scriptSrc = constant "/php/getUser.php"

helloUser : Signal String
helloUser = prettyPrint <~ sendReq scriptSrc "post"

-- Constants
topBarHeight = 20
logoHeight = 30

-- Visuals
headerBuilder : (Int,Int) -> String -> Element
headerBuilder (w,h) username =
  let title = toText "local liquidator"
             |> width w
             . centered
             . italic
             . Text.color lightYellow
             . Text.height (maximum [logoHeight, (toFloat w / 20)])
      welcome = case username of
        "" -> plainText "not logged in (404 error)"
        "guest" -> plainText "Welcome Guest"
        "waiting" -> plainText "waiting..."
        a -> plainText ("Welcome, " ++ a)
        _ -> plainText "wat?"
  in flow down 
    [ title
    , flow right [navs, welcome]
    , spacer w 10 |> color lightYellow 
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
  , ("Create Ad", "/MakeAd.html")
  , ("Add User (test)", "/addUserTest.html")
  ]

hdr : Signal Element
hdr = headerBuilder <~ Window.dimensions ~ helloUser
