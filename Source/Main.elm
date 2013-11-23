import Mouse
import Window
import AdMaker (adArea)
import MapMaker (mapArea)
import Header (header)

-- Element sizes
sideBarWidth = widthOf <~ adArea
headerHeight = heightOf <~ header

main = sigFlow down 
        [ header
        , adArea
        ]

-- helpers
sigFlow dir args = flow dir <~ combine args
