module LogIn exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (Model)
import Msg exposing (Msg)

view : Model -> Html Msg
view model =
    div [] 
        [ div [] [ text "Please log in." ]
        , input [ placeholder "Username" ] []
        , input [ type' "password", placeholder "Password" ] []
        , button [] [ text "Log In" ]
        ]

