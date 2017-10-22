module Franc exposing (..)


type alias Amount =
    Int


type Franc
    = Franc Amount


times : Int -> Franc -> Franc
times multiplier (Franc amount) =
    Franc <| multiplier * amount


amount : Franc -> Int
amount (Franc amount) =
    amount
