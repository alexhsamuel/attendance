module Attendance exposing (..)

import CheckIn
import Debug exposing (log)
import Dict
import Html exposing (..)
import Html.Attributes exposing (..)
import LogIn
import Model
import Msg exposing (Msg)
import Navigation
import Routing exposing (Route)

update : Msg -> Model.Model -> (Model.Model, Cmd Msg)
update msg model = (model, Cmd.none)

notFoundView : Html Msg
notFoundView =
    div [] [ text "Not Found" ]

page : Model.Model -> Html Msg
page model =
    case model.route of
        Routing.LogInRoute -> LogIn.view model
        Routing.CheckInRoute -> CheckIn.view model
        Routing.NotFoundRoute -> notFoundView

view model = 
    div 
        [ style 
            [ ("padding", "40px")
            , ("font-family", "Menlo") 
            ] 
        ]
        [ page model ]

init : Result String Route -> (Model.Model, Cmd Msg)
init result =
    ( Model.initialModel (Routing.routeFromResult result)
    , Cmd.none
    )

urlUpdate : Result String Route -> Model.Model -> (Model.Model, Cmd Msg)
urlUpdate result model =
    ( { model | route = Routing.routeFromResult result }
    , Cmd.none
    )

main = Navigation.program 
    Routing.parser
    { init = init
    , subscriptions = (\model -> Sub.none)
    , update = update
    , urlUpdate = urlUpdate
    , view = view
    }

