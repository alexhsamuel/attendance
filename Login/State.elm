module Login.State exposing (..)

import Login.Types exposing (..)

initialModel : Model
initialModel = Model "" "" Nothing

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        ChangeUsername username 
            -> ({ model | username = username }, Cmd.none)
        ChangePassword password 
            -> ({ model | password = password }, Cmd.none)
        Submit 
            -- FIXME: Check password!
            -> ({ model | login = Just model.username }, Cmd.none)
