import Window as W
import Graphics.Input as Input
import Keyboard

inputColor = white 
todoWidth = 300
leftPadding = 10
inputHeight = 48

entered = keepIf id True Keyboard.enter

taskField = Input.fields Input.emptyFieldState

fieldState = merge taskField.events
  (sampleOn entered (constant Input.emptyFieldState))

inputBar : Input.FieldState -> Element
inputBar fieldState =
  color inputColor . container todoWidth (inputHeight - 2) midRight .
  color inputColor . size (todoWidth - leftPadding) inputHeight <|
  taskField.field id "What needs to be done?" fieldState
      

display (w,h) fieldState =
 let pos = midTopAt (relative 0.5) (absolute 40) in
 layers [ fittedImage w h "/images/shells.jpg", container w h pos <| flow down [inputBar fieldState] ]

main = display <~ W.dimensions ~ fieldState
