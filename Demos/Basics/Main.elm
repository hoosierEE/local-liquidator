import Window
import AdMaker (adArea)
import Header (header)

sigFlow dir args = flow dir <~ combine args

main = sigFlow down 
  [ header <~ Window.dimensions
  , adArea ]
