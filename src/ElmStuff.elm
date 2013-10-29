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

scene (w,h) locs =
  let drawPentagon (x,y) =
          ngon 5 20 |> filled (hsva (toFloat x) 1 1 0.7)
                    |> move (toFloat x - toFloat w / 2, toFloat h / 2 - toFloat y)
                    |> rotate (toFloat x)
  in  layers [ collage w h (map drawPentagon locs)
             , plainText "Click to stamp a pentagon." ]

main = lift2 scene Window.dimensions clickLocations

-- Export the number of stamps to JS with the name "count"
stampCount = lift (JS.fromInt . length) clickLocations
foreign export jsevent "count"
    stampCount : Signal JS.JSNumber
