module Main exposing (suite)

import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import Levenshtein
import Levenshtein2


suite : Benchmark
suite =
    describe "Levenshtein"
        [ Benchmark.compare "distance"
            "String"
            (\_ -> Levenshtein.distance "kitten" "sitting")
            "Array"
            (\_ -> Levenshtein2.distance "kitten" "sitting")
        ]


main : BenchmarkProgram
main =
    program suite
