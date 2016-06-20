module Login.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Login.Types exposing (..)

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
        , button [ onClick Submit ] [ text "Log In" ]
        ]

