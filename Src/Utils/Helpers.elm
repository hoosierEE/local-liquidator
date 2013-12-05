module Utils.Helpers where

import Graphics.Input as Input

butn = Input.customButtons ""

buttonGen str =
  let
    box c1 c2 =
      let
        word  = width 100 . centered . Text.color darkRed . Text.height 20 . toText <| str
        grad  = linear (0,29) (0,-29) [ (0,c1),(1,c2) ]
      in collage 100 38 [ gradient grad (rect 98 36), toForm word ]
  in butn.customButton str (box white lightOrange)
                              (box lightYellow darkOrange)
                              (box red lightOrange)

headerGen w h c = width w . centered . Text.color c . Text.height h . toText
