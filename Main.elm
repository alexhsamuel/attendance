module Main exposing (..)

import CheckIn
import Debug exposing (log)
import Dict
import Html exposing (..)
import Html.App
import Html.Attributes exposing (..)
import Login.State
import Login.Types
import Login.View
import Model
import Msg exposing (..)
import Navigation
import Routing exposing (Route)

update : Msg -> Model.Model -> (Model.Model, Cmd Msg)
update msg model = 
    let model = (log "model" model) in
    case msg of
        LoginMsg msg -> 
            let
                (newModel, cmd) = Login.State.update msg model.login
            in
                ({ model | login = newModel }, Cmd.map LoginMsg cmd)

notFoundView : Html Msg
notFoundView =
    div [] [ text "Not Found" ]

page : Model.Model -> Html Msg
page model =
    case model.route of
        Routing.LoginRoute 
            -> Html.App.map LoginMsg (Login.View.view model.login)
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

