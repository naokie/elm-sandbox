module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- INIT


init : ( Model, Cmd Msg )
init =
    ( { message = ""
      , apiKey = "CaUfdl8435zBNQ5xs21i6uIZOfyqGK6W"
      , images = [ { username = "", imageUrl = "" } ]
      }
    , Cmd.none
    )



-- MODEL


type alias Model =
    { message : String
    , apiKey : String
    , images : List Giphy
    }


type alias Giphy =
    { username : String
    , imageUrl : String
    }


type Msg
    = GetTrending
    | GotTrending (Result Http.Error (List Giphy))



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetTrending ->
            ( { model | message = "画像を取得中" }, getTrending model.apiKey )

        GotTrending (Err e) ->
            ( { model | message = toString e }, Cmd.none )

        GotTrending (Ok images) ->
            ( { model | images = images, message = "画像の取得が完了しました" }, Cmd.none )


getTrending : String -> Cmd Msg
getTrending apiKey =
    let
        url =
            "https://api.giphy.com/v1/gifs/trending"
                ++ "?api_key="
                ++ apiKey
                ++ "&limit=10"
                ++ "&rating=G"

        request =
            Http.get url decodeGiphy
    in
    Http.send GotTrending request


decodeGiphy : Decode.Decoder (List Giphy)
decodeGiphy =
    Decode.at [ "data" ] (Decode.list decodeImage)


decodeImage : Decode.Decoder Giphy
decodeImage =
    Decode.map2 Giphy
        (Decode.at [ "username" ] Decode.string)
        (Decode.at [ "images", "preview_gif", "url" ] Decode.string)



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ p [] [ text model.message ]
        , button [ onClick GetTrending ] [ text "Get Trending" ]
        , div [] (List.map giphyListItem model.images)
        ]


giphyListItem : Giphy -> Html Msg
giphyListItem giphy =
    div []
        [ p [] [ text giphy.username ]
        , img [ src giphy.imageUrl ] []
        ]
