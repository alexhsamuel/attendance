module Login.Types exposing (Model, Msg, Msg(..))

type alias Model =
    { username : String
    , password : String
    , login : Maybe String
    }

type Msg
    = ChangeUsername String
    | ChangePassword String
    | Submit
