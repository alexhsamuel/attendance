module CheckIn exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (Model)
import Msg exposing (Msg)

greeting model
    = case model.login.login of
        Just login -> [ text ("Hello, " ++ login ++ "!") ]
        Nothing -> 
            [ text "Please "
            , a [ href "#login" ] [ text "log in" ]
            , text "."]

view : Model -> Html Msg
view model =
    div [] 
        [ div [] (greeting model)
        ]

