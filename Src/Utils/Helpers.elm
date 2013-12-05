module Utils.Helpers where

import Graphics.Input as Input
import Http

scriptSrc : Signal String
scriptSrc = constant "/php/getUser.php"

helloUser : Signal String
helloUser = prettyPrint <~ sendReq scriptSrc

sendReq : Signal String -> Signal (Http.Response String)
sendReq str = Http.send <| (\r -> Http.post r "" ) <~ str

prettyPrint : Http.Response String -> String 
prettyPrint res = case res of
  Http.Waiting     -> ""
  Http.Failure _ _ -> "" -- for debugging
  Http.Success a   -> a 



butn = Input.customButtons ""

buttonGen str =
  let
    box c1 c2 =
      let
        word  = width 100 . centered . Text.color darkRed . Text.height 20 . toText <| str
        grad  = linear (0,29) (0,-29) [ (0,c1),(1,c2) ]
      in collage 100 38 [ gradient grad (rect 98 36), toForm word ]
  in butn.customButton str (box white lightOrange)
                              (box white darkOrange)
                              (box red lightOrange)

headerGen w h c = width w . centered . Text.color c . Text.height h . toText
