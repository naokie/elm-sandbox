module Example exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Hello as Hello


suite : Test
suite =
    describe "Hello Test"
        [ test "Hello" <|
            \_ ->
                Hello.hello
                    |> Expect.equal "hello"
        ]
