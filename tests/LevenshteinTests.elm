module LevenshteinTests exposing (suite)

import Expect
import Levenshtein exposing (distance)
import Test exposing (..)


suite : Test
suite =
    describe "distance"
        [ test "distance is zero for identical strings" <|
            \_ ->
                Expect.equal 0 (distance "hello" "hello")
        , test "distance is the length of the first string if the second string is empty" <|
            \_ ->
                Expect.equal 5 (distance "hello" "")
        , test "distance is the length of the second string if the first string is empty" <|
            \_ ->
                Expect.equal 5 (distance "" "hello")
        , test "distance is the Levenshtein distance" <|
            \_ ->
                Expect.equal 3 (distance "kitten" "sitting")
        ]
