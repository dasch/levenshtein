module Main exposing (suite)

import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import Levenshtein


strLength =
    10


str1 =
    String.repeat strLength "x"


str2 =
    String.repeat strLength "y"


suite : Benchmark
suite =
    describe "Levenshtein.distance"
        [ benchmark "worst case" <|
            \_ -> Levenshtein.distance str1 str2
        , benchmark "best case" <|
            \_ -> Levenshtein.distance str1 str1
        , benchmark "typical case" <|
            \_ -> Levenshtein.distance "kitten" "sitting"
        ]


main : BenchmarkProgram
main =
    program suite
