module Utils.Model where

type Advert = { title:String
              , isbn10:Int
              , isbn13:Int
              , imageUrl:String
              , expTime:Int
              , description:String
              , condition:String
              , user:String
              , adType:Bool
              , lat:Float
              , lon:Float
              }
type AdvertList = { ads:[Advert], uid:Int }

initialState : AdvertList
initialState = { ads=[], uid=0 }

data Action = Add Advert | Remove Int

-- main = asText initialState
