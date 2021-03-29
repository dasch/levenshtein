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
        , test "distance is the Levenshtein distance regression" <|
            \_ ->
                Expect.equal 3 (distance "dependent" "independant")
        , fuzz2 Fuzz.string Fuzz.string "distance is at least the difference between the length of the strings" <|
            \example1 example2 ->
                let
                    diff =
                        abs (String.length example1 - String.length example2)
                in
                Expect.atLeast diff (distance example1 example2)
        ]
