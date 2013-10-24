module ElmStuff where

import JavaScript as JS
import Window
import Mouse

foreign import jsevent "reset" (JS.fromInt 42)
  resets : Signal JS.JSNumber
  
events : Signal (Maybe (Int,Int))
events = merge (Just <~ sampleOn Mouse.clicks Mouse.position)
  (sampleOn resets (constant Nothing))

clickLocations = 
 let update event locations = case event of
  Just loc -> loc::locations
  Nothing -> []
 in foldp update [] events

main = color green <| container 280 280 middle <| asText "Hello from inside a <div>!"
