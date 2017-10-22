module Tests exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Hello as Hello
import Dollar exposing (..)
import Franc exposing (..)


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
        [ describe "Dollar"
            [ test "Multiplication1" <|
                \_ ->
                    Dollar 5
                        |> Dollar.times 2
                        |> Expect.equal (Dollar 10)
            , test "Multiplication2" <|
                \_ ->
                    Dollar 5
                        |> Dollar.times 3
                        |> Expect.equal (Dollar 15)
            ]
        , describe "Franc"
            [ test "Multiplication1" <|
                \_ ->
                    Franc 5
                        |> Franc.times 2
                        |> Expect.equal (Franc 10)
            , test "Multiplication2" <|
                \_ ->
                    Franc 5
                        |> Franc.times 3
                        |> Expect.equal (Franc 15)
            ]
        ]
