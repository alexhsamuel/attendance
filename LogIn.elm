module LogIn exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

type alias Model =
    { username : String
    , password : String
    }

initialModel : Model
initialModel = Model "" ""

type Msg
    = ChangeUsername String
    | ChangePassword String

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        ChangeUsername username 
            -> ({ model | username = username }, Cmd.none)
        ChangePassword password 
            -> ({ model | password = password }, Cmd.none)

view : Model -> Html Msg
view model =
    div [] 
        [ div [] [ text "Please log in." ]
        , input 
            [ placeholder "Username"
            , onInput ChangeUsername 
            ] 
            []
        , input 
            [ type' "password"
            , placeholder "Password"
            , onInput ChangePassword ] 
            []
        , button [] [ text "Log In" ]
        ]

