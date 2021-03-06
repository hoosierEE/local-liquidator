module Header where

import Window
import Utils.Layout as Layout
import Utils.Rest as Rest

title w msg = let
    h = toFloat <| max 30 (round (toFloat w / 20))
    hdr = link "/" <| Layout.headerGen w h darkOrange "local-liquidator"
    underLine = spacer w 2 |> color darkOrange
  in layers [ msg, flow down [ hdr, navRow w, underLine ]]

welcomeMessage = let
    txt = Layout.headerGen 100 18 darkOrange 
    msg rsp = case rsp of
      "" -> txt "~"
      "guest" -> txt "please login"
      _  -> txt <| "welcome " ++ rsp
  in msg <~ Rest.helloUser

navigation = [ ("/MakeAd.html"              , "Create Ad")
             , ("/php/findUserPosition.html", "My Ads"   )
             , ("/About.html"               , "About"    )
             , ("/php/php_cas.php"          , "Login"    ) 
             , ("/php/cas_logout.php"       , "Logout"   ) ]

navButtons = let
    navButton (href, name) = link href <| Layout.buttonGen name
  in map navButton navigation

navRow w = let bar = flow right navButtons 
  in container w (heightOf bar) middle bar

main = title <~ Window.width ~ welcomeMessage
