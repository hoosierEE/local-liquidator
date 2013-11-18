module Header (header) where
import Layout as L
import Window

header (w,h) =
  let title = plainText "Local Liquidator"
      layoutMsg = L.msg (w,h)
      words = flow right [title, layoutMsg]
  in container w 50 middle words |> color lightBlue
-- main = scene <~ Window.width
