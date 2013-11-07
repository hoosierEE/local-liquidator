import Graphics.Input as Input
import Keyboard
import Window



-- Model
-- All of the information needed to represent a Task
type Task = { done:Bool, description:String, id:Int }
-- The state of the application is a list of tasks and an
-- ID for naming tasks uniquely.
type TodoState = { tasks:[Task], uid:Int }
initialState : TodoState
initialState = { tasks=[], uid=0 }
-- Actions the user can take to modify the TodoState
data Action = Add String | Remove Int


-- Update
update action state =
    case action of
      -- ignore if the user tries to add an empty task
      Add "" -> state

      -- add a task with a unique ID
      Add taskDescription ->
          { tasks = (Task False taskDescription state.uid) :: state.tasks
          , uid   = state.uid + 1 }

      -- keep tasks that do not have the removed ID
      Remove id ->
          { state |
              tasks <- filter (\task -> task.id /= id) state.tasks
          }


-- Inputs
entered = keepIf id True Keyboard.enter
taskField = Input.fields Input.emptyFieldState
fieldState = merge taskField.events
                   (sampleOn entered (constant Input.emptyFieldState))
-- Keep track of buttons for deleting tasks.
taskDelete = Input.customButtons 0
actions = merge (Add <~ sampleOn entered (.string <~ taskField.events))
                (Remove <~ taskDelete.events)



-- Display
todoWidth   = 500
leftPadding = 60
buttonWidth = 30
taskHeight  = 30

titleColor   = rgb 179 179 179
spacerColor1 = rgb 141 125 119
spacerColor2 = rgb 108 125 119
inputColor   = rgb 247 247 247
taskColor    = rgba 255 255 255 0.9

inputBar fieldState =
    color inputColor . container todoWidth 45 midRight .
    color inputColor . size (todoWidth - leftPadding) 45 <|
        taskField.field id "What needs to be done?" fieldState
displayTask task =
    let btn clr = let x = text . Text.height (taskHeight-4) . Text.color clr <| toText "&times;"
                  in container buttonWidth taskHeight middle x
        taskWidth = todoWidth - leftPadding - buttonWidth
    in color taskColor . container todoWidth taskHeight midRight <|
       flow right [ container taskWidth taskHeight midLeft . text <| toText task.description
                  , taskDelete.customButton task.id
                        (btn inputColor) (btn titleColor) (btn red)
                  ]
display (w,h) fieldState tasks =
    let pos = midTopAt (relative 0.5) (absolute 40) in
    layers [ container w h pos <| flow down [ inputBar fieldState
                                             , flow down (map displayTask tasks)
                                             ]
           ]
           
currentState = foldp update initialState actions
main = display <~ Window.dimensions ~ fieldState ~ lift .tasks currentState
