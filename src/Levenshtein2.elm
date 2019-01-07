module Levenshtein2 exposing (distance)

import Array exposing (Array)
import Dict exposing (Dict)


type alias Memo =
    Dict Key Int


type alias Key =
    ( Int, Int )


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


distance : String -> String -> Int
distance str1 str2 =
    if str1 == str2 then
        0

    else
        helper
            (Array.fromList (String.toList str1))
            (Array.fromList (String.toList str2))


helper arr1 arr2 =
    let
        lev : Memo -> ( Int, Int ) -> ( Memo, Int )
        lev memo ( i, j ) =
            case ( Array.get (i - 1) arr1, Array.get (j - 1) arr2 ) of
                ( Just chr1, Just chr2 ) ->
                    let
                        indicator =
                            if chr1 /= chr2 then
                                1

                            else
                                0

                        ( memo1, dist1 ) =
                            fetch ( i - 1, j ) lev memo

                        ( memo2, dist2 ) =
                            fetch ( i, j - 1 ) lev memo1

                        ( memo3, dist3 ) =
                            fetch ( i - 1, j - 1 ) lev memo2
                    in
                    ( memo3
                    , min3
                        (dist1 + 1)
                        (dist2 + 1)
                        (dist3 + indicator)
                    )

                _ ->
                    ( memo, max i j )
    in
    lev Dict.empty ( Array.length arr1, Array.length arr2 )
        |> Tuple.second


min3 : comparable -> comparable -> comparable -> comparable
min3 a b c =
    min (min a b) c
