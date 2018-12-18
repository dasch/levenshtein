module LevenshteinTests exposing (suite)

import Expect
import Fuzz
import Levenshtein exposing (distance)
import Test exposing (..)


suite : Test
suite =
    describe "distance"
        [ fuzz Fuzz.string "distance is zero for identical strings" <|
            \example ->
                Expect.equal 0 (distance example example)
        , fuzz Fuzz.string "distance is the length of the first string if the second string is empty" <|
            \example ->
                Expect.equal (String.length example) (distance example "")
        , fuzz Fuzz.string "distance is the length of the second string if the first string is empty" <|
            \example ->
                Expect.equal (String.length example) (distance "" example)
        , test "distance is the Levenshtein distance" <|
            \_ ->
                Expect.equal 3 (distance "kitten" "sitting")
        ]
