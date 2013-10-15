import Graphics.Input as Input
import Window

(field,content) = Input.field "type here"

main = (\n-> flow down <~ (combine n)) [
 appArea
 ] -- , notes <~ Window.dimensions] --could put "about" section here.
  

appArea = (\n-> flow right <~ (combine n)) [
 adSpace
 , color green <~ (mapArea <~ Window.dimensions)]


-- adSpace is where the list of ads is displayed, 
--   and also where users can create one
adSpace = (\n-> flow down <~ (combine n)) [
  constant (color red (spacer 250 3))
  , createAd
  , constant (color red (spacer 250 3))
  , adList {a = "hello, record.a", b = 40}
  , constant (color red (spacer 250 3))]
-- create an ad
createAd =
 let
  results = 
    let parseString x = case x of
        [] -> show "Your Ad Content"
        _ -> show x
    in parseString <~ content
  md = [markdown|

#### Create an Ad:
  |]
 in (\n-> flow down <~ (combine n)) [constant md
  , color white <~ field
  , text . (typeface "georgia, palatino, serif") . toText <~ results]
-- show the current ads
adList records = 
 let 
  results = flow down <| 
    map plainText [
    "item1"
    , "item2"
    , records.a
    , show records.b]
  md = [markdown|

#### List of Ads:
  |]
 in (\n-> flow down <~ (combine n)) [constant md
  , constant results]


-- mapArea is where the map with markers is displayed
mapArea (w,h) = 
 let 
  wideScreen = w > h
  xform amt = (round <| (toFloat w) * amt)
  w' = if wideScreen then xform 0.75 else xform 0.5
  h' = (round <| (toFloat h) * 0.6)
 in container w' h' middle (plainText "Map Goes Here")
 
 


-- These are just notes for the ID team.
notes (w,h) = 
 let
  w1 = w -- w `div` 3
  h1 = h
  words x = width x [markdown|

# Local-Liquidator

## Key Features (get these working first):
* Display nearby ads
    * as a list
    * on a map
* Create ad
    * user-entered text description
    * user's coordinates
    * coordinates and description published for all to see

## Secondary Features:
* Log in as guest or with CAS
* Ads will have a "logged in with CAS" tag or parameter

## Tertiary Features:
* Ability to contact people from within the app
* Option to add contact details to the app
* Other users will not see your email address unless you reply to them.
  |]
 in words w1
