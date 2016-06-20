module CheckIn exposing (..)

import Html exposing (..)
import Model exposing (Model)
import Msg exposing (Msg)

greeting model
    = case model.student of
        Just student -> "Hello, " ++ student ++ "!"
        Nothing -> "Please log in."

view : Model -> Html Msg
view model =
    div [] 
        [ div [] [ text (greeting model) ]
        ]

