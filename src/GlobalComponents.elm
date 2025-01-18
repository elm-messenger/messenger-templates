module GlobalComponents exposing (allGlobalComponents)

{-|


# Global Component Configuration

Record all the global components to load at the beginning here

@docs allGlobalComponents

-}

import Lib.Base exposing (SceneMsg)
import Lib.UserData exposing (UserData)
import Messenger.Scene.Scene exposing (GlobalComponentStorage)


{-| All global components to load at the beginning of the game.
-}
allGlobalComponents : List (GlobalComponentStorage UserData SceneMsg)
allGlobalComponents =
    []
