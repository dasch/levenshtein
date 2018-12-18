module Levenshtein exposing (distance)


distance : String -> String -> Int
distance str1 str2 =
    let
        len1 =
            String.length str1

        len2 =
            String.length str2

        indicator =
            if chr1 /= chr2 then
                1

            else
                0

        chr1 =
            String.right 1 str1

        chr2 =
            String.right 1 str2
    in
    if min len1 len2 == 0 then
        max len1 len2

    else
        min
            (min
                (distance (String.dropRight 1 str1) str2 + 1)
                (distance str1 (String.dropRight 1 str2) + 1)
            )
            (distance (String.dropRight 1 str1) (String.dropRight 1 str2) + indicator)
