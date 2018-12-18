module Memo exposing (Memo, empty, fetch)

import Dict exposing (Dict)


type alias Memo =
    Dict Key Int


type alias Key =
    ( String, String )


empty : Memo
empty =
    Dict.empty


fetch : Key -> (Memo -> Key -> ( Memo, Int )) -> Memo -> ( Memo, Int )
fetch key f memo =
    case Dict.get key memo of
        Just value ->
            ( memo, value )

        Nothing ->
            let
                ( newMemo, value ) =
                    f memo key
            in
            ( Dict.insert key value newMemo, value )
