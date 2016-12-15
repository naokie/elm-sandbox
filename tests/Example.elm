module Example exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Hello as Hello


helloTest : Test
helloTest =
    describe "Hello Test"
        [ test "Hello" <|
            \_ ->
                Hello.hello
                    |> Expect.equal "hello"
        , test "olloH" <|
            \_ ->
                Hello.hello
                    |> String.reverse
                    |> Expect.equal "olleh"
        ]


listTest : Test
listTest =
    describe "List"
        [ test "Empty List" <|
            \_ ->
                List.length []
                    |> Expect.equal 0
        ]
