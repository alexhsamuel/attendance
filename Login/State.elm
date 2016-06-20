module Login.State exposing (..)

import Login.Types exposing (..)
import Routing

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
            -- FIXME: Check username!
            -- FIXME: Check password!
            -> ({ model | login = Just model.username }, Routing.toCheckin)
