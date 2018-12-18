module Levenshtein exposing (distance)


distance : String -> String -> Int
distance str1 str2 =
    let
        len1 =
            String.length str1

        len2 =
            String.length str2
    in
    if min len1 len2 == 0 then
        max len1 len2

    else
        0
