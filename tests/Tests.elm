module Tests exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Hello as Hello
import Dollar exposing (..)


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


dollarTest : Test
dollarTest =
    describe "Money Test"
        [ test "Multiplication" <|
            \_ ->
                let
                    amount =
                        Dollar 5
                            |> Dollar.times 2
                            |> Dollar.amount
                in
                    Expect.equal amount 10
        ]
