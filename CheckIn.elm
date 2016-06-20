module CheckIn exposing (..)

import Dict
import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (Model)
import Msg exposing (Msg)

greeting model =
    case model.login.login of
        Just login -> [ text ("Hello, " ++ login ++ "!") ]
        Nothing ->
            [ text "Please "
            , a [ href "#login" ] [ text "log in" ]
            , text "."]

formatAttendance name value =
    [ text (name ++ ": " ++ (if value then "present" else "absent")) ]

view : Model -> Html Msg
view model =
    div []
        [ div [] (greeting model)
        , text "Today's attendance: "
        , ul []
          (List.map
              (\(n, a) -> li [] (formatAttendance n a))
              (Dict.toList model.attendance)
          )
        ]
