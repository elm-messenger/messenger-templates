module SceneProtos.$0.Model exposing (scene)

{-| Scene configuration module

@docs scene

-}

import Lib.Base exposing (SceneMsg)
import Lib.UserData exposing (UserData)
import Messenger.Base exposing (Env, addCommonData)
import Messenger.Scene.LayeredScene exposing (LayeredSceneLevelInit, LayeredSceneProtoInit, LayeredSceneSettingsFunc, genLayeredScene, initCompose)
import Messenger.Scene.Scene exposing (SceneStorage)
import SceneProtos.$0.Init exposing (InitData)
import SceneProtos.$0.LayerBase exposing (..)


commonDataInit : Env () UserData -> Maybe InitData -> SceneCommonData
commonDataInit _ _ =
    {}


init : LayeredSceneProtoInit SceneCommonData UserData LayerTarget LayerMsg SceneMsg InitData
init env data =
    let
        cd =
            commonDataInit env data

        envcd =
            addCommonData cd env
    in
    { renderSettings = []
    , commonData = cd
    , layers =
        []
    }


settings : LayeredSceneSettingsFunc SceneCommonData UserData LayerTarget LayerMsg SceneMsg
settings _ _ _ =
    []


{-| Scene generator
-}
scene : LayeredSceneLevelInit UserData SceneMsg InitData -> SceneStorage UserData SceneMsg
scene initd =
    genLayeredScene (initCompose init initd) settings
