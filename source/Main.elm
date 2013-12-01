import Mouse
import Window
import Utils.Header (hdr)

-- Element sizes
headerHeight = heightOf <~ hdr 

main = sigFlow down [ hdr ] 

-- helpers
sigFlow dir args = flow dir <~ combine args
