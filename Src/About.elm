module About where

import Window
import Utils.Layout as Layout

prettyHeader w = Layout.headerGen w 29 darkOrange

md (w,h) = let
    w' = maximum [(round <| toFloat w * 0.8), 400]
    h' = heightOf elements
    heading1 = prettyHeader w' "The Textbook Solution"
    heading2 = prettyHeader w' "How It Works"
    heading3 = prettyHeader w' "Where is the ISBN?"
    md1 = [markdown|
Even when you buy used college books from the store you know they cost way too much! 
And to add insult to injury when you go to sell back college books to the bookstore 
they want to offer you mere pennies for your college textbooks. Well now you do not 
have to take this abuse anymore. Do you know you can Sell Back Your Book yourself to
make sure you get the most for your college textbooks on campus? But how can you 
locate those who need you textbooks? That is where we come in, to solve this problem 
for you and everyone around you by starting  Local-Liquidator on campus.  
    |]

    md2 = [markdown|
* First, login with your IUPUI student username and password
* then you can Sell/Buy your textbooks now! 

To Sell Back Your Book and get top Textbook Buyback Prices, enter the ISBN of the textbooks 
(either 10 or 13) you wish to sell and click the Sell button! Students and Professors 
can get the most bargain for their textbooks on Local-Liquidator any time! 
Also if you want to buy textbook all you need to do is search for the textbook with 
it ISBN then click on the Buy button!
Sell your textbooks, get paid immediately, its just that simple! Did you know that if 
you wait to sell your textbooks until the following semester, they may be worthless? 
Publishers frequently publish new editions of textbooks and when your book becomes the 
'old edition' it loses a lot of value. Do not let this happen to you, sell your textbooks today!
|]

    md3 = [markdown|
Your books ISBN number is commonly be found on the back of the book above the barcode.
    |]
 
    pics = let
      imageWidth = (w' `div` 3) - 10
      imageHeight = round <| toFloat imageWidth * 3 / 4
    in flow right <| map (\n-> fittedImage imageWidth imageHeight n) ["/images/cover.JPG", "/images/backCover.JPG", "/images/closeUp.JPG"]
    elements = flow down <| map (\n-> width w' n)
          [ heading1
          , md1
          , heading2
          , md2
          , heading3
          , pics ]
  in container w h' midTop elements


main = flow down <~ combine [ md <~ Window.dimensions ]
