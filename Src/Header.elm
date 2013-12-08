module Header where

import Window
import Utils.Layout as Layout
import Utils.Rest as Rest

title w msg = let
    h = toFloat <| max 30 (w `div` 20)
    hdr = Layout.headerGen w h darkOrange "local-liquidator"
    underLine = spacer w 2 |> color darkOrange
    scene = layers [flow down [ hdr, navRow w, underLine ], msg ]
  in scene

welcomeMessage = let
    txt = Layout.headerGen 100 18 darkOrange 
    msg rsp = case rsp of
      "" -> txt ""
      "Guest" -> txt "Hi Guest, log in to do stuff"
      _  -> txt <| "welcome " ++ rsp
  in msg <~ Rest.helloUser

navigation = [ ("/MakeAd.html"       , "Create Ad")
             , ("/MyAds.html"        , "My Ads"   )
             , ("/About.html"        , "About"    )
             , ("/php/php_cas.php"   , "Login"    ) 
             , ("/php/cas_logout.php", "Logout"   ) ]

navButtons = let
    navButton (href, name) = link href <| Layout.buttonGen name
  in map navButton navigation

navRow w = let bar = flow right navButtons 
  in container w (heightOf bar) middle bar

main = title <~ Window.width ~ welcomeMessage
