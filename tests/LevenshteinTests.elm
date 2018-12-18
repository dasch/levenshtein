module LevenshteinTests exposing (suite)

import Expect
import Fuzz
import Levenshtein exposing (distance)
import Test exposing (..)


suite : Test
suite =
    fuzz Fuzz.string "distance is zero for identical strings" <|
        \example ->
            Expect.equal 0 (distance example example)
