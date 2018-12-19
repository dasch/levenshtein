module Levenshtein exposing (distance)

import Memo exposing (Memo)


distance : String -> String -> Int
distance str1 str2 =
    let
        ( _, result ) =
            lev Memo.empty ( str1, str2 )
    in
    result


lev : Memo -> ( String, String ) -> ( Memo, Int )
lev memo ( str1, str2 ) =
    let
        len1 =
            String.length str1

        len2 =
            String.length str2
    in
    if str1 == str2 then
        ( memo, 0 )

    else if min len1 len2 == 0 then
        ( memo, max len1 len2 )

    else
        let
            chr1 =
                String.right 1 str1

            chr2 =
                String.right 1 str2

            indicator =
                if chr1 /= chr2 then
                    1

                else
                    0

            newStr1 =
                String.dropRight 1 str1

            newStr2 =
                String.dropRight 1 str2

            ( memo1, dist1 ) =
                Memo.fetch ( newStr1, str2 ) lev memo

            ( memo2, dist2 ) =
                Memo.fetch ( str1, newStr2 ) lev memo1

            ( memo3, dist3 ) =
                Memo.fetch ( newStr1, newStr2 ) lev memo2
        in
        ( memo3
        , min3
            (dist1 + 1)
            (dist2 + 1)
            (dist3 + indicator)
        )


min3 : comparable -> comparable -> comparable -> comparable
min3 a b c =
    min (min a b) c
