module Utils.Content (box) where

import Window

box stuff =
  let c w = width w <| stuff
  in c <~ Window.width
