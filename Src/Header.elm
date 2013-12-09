module Header where

import Window
import Utils.Layout as Layout
import Utils.Rest as Rest

title w msg = let
    h = toFloat <| max 30 (w `div` 20)
    hdr = link "/welcome.html" <| Layout.headerGen w h darkOrange "local-liquidator"
    underLine = spacer w 2 |> color darkOrange
    scene = flow inward [flow down [ hdr, navRow w, underLine ], msg ]
  in scene

welcomeMessage = let
    txt = Layout.headerGen 100 18 darkOrange 
    msg rsp = case rsp of
      "" -> txt ""
      "guest" -> txt "hi guest, please login"
      _  -> txt <| "welcome " ++ rsp
  in msg <~ Rest.helloUser

navigation = [ ("/MakeAd.html"          , "Create Ad")
             , ("/php/newGetUserAds.php", "My Ads"   )
             , ("/About.html"           , "About"    )
             , ("/php/php_cas.php"      , "Login"    ) 
             , ("/php/cas_logout.php"   , "Logout"   ) ]

navButtons = let
    navButton (href, name) = link href <| Layout.buttonGen name
  in map navButton navigation

navRow w = let bar = flow right navButtons 
  in container w (heightOf bar) middle bar

main = title <~ Window.width ~ welcomeMessage
