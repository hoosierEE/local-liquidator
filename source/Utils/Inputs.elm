module Utils.Inputs (controls, isbnRequestString) where

import Graphics.Input as Input
import Utils.HttpFunctions (prettyPrint, sendReq)
import Utils.Validation (validate, btnClicked)
import Utils.Header (helloUser)

-- Logic
validIsbn    = (\n->validate n "isbn"   ) <~ isbnSignal
validPrice   = (\n->validate n "price"  ) <~ priceSignal
validExpTime = (\n-> validate n "expire") <~ expTimeSignal

isbnRequestString =
  let ajax s = case s of
    "" -> "null"
    _  -> "/php/checkISBN.php?isbn=" ++ s
  in dropRepeats (ajax <~ validIsbn)

adDisplay = plainText <~ constant "" -- (prettyPrint <~ adRequestString)

adRequestString =
  let
    baseUrl adType price user isbn expTime =
      "/php/storeAd.php?user=" ++ user
      ++ "&ExpTime=" ++ expTime 
      ++ "&Price=" ++ price
      ++ "&Adtype=" ++ adType
      ++ "&ISBN10=" ++ isbn
    whichButton =
      let ss = keepWhen (btnClicked sellEvent) "" (constant "sell")
          bs = keepWhen (btnClicked buyEvent) "" (constant "buy")
      in merge ss bs
  in sendReq (sampleOn whichButton (baseUrl <~ whichButton ~ validPrice ~ helloUser ~ validIsbn ~ validExpTime)) "get"

-- Model
(isbn  , isbnSignal   ) = Input.field "ISBN"
(price , priceSignal  ) = Input.field "Price"
(expire, expTimeSignal) = Input.field "Expire Time"
(buy   , buyEvent     ) = Input.button "Buy"
(sell  , sellEvent    ) = Input.button "Sell"
                          
-- View
controls =
  let
    arranged a b c d f = 
      let h = map heightOf [a,b,c,d,f] |> foldr (+) 0
          w = map widthOf [a,b,c,d,f] |> maximum
          border = 10
          title = width 200 . centered . Text.height 20 . Text.color darkYellow <| toText "Controls"
      in flow down [title, flow down [a,b,c,d,f] |> container (w + border) (h + border) middle |> color lightBlue]
    btngroup = constant <| flow right [buy, sell]
  in arranged <~ isbn ~ price ~ expire ~ btngroup ~ adDisplay
