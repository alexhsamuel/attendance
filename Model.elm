module Model exposing (..)

import Dict
import Login.State
import Login.Types
import Routing

students : List String
students = 
    [ "alex"
    , "beth"
    , "chris"
    , "dave"
    , "elise"
    , "frank"
    , "gwen"
    , "harry"
    , "irene"
    , "jack"
    ]

type alias Model =
    { student : Maybe String
    , route : Routing.Route
    , students : List String
    , attendance : Dict.Dict String Bool

    -- Page models
    , login : Login.Types.Model
    }

initialModel : Routing.Route -> Model
initialModel route = 
    { student = Nothing
    , route = route
    , students = students
    , attendance = Dict.fromList (List.map (\n -> (n, False)) students)

    , login = Login.State.initialModel
    }

