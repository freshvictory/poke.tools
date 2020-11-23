port module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html.Styled exposing (Html, div, text, toUnstyled)
import Page
import Page.Dex as Dex
import Page.Home as Home
import Url
import Url.Parser as Parser
    exposing
        ( Parser
        , map
        , oneOf
        , s
        , top
        )



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.application
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }


port blurActiveElement : () -> Cmd msg



---- MODEL ----


type alias Model =
    { key : Nav.Key
    , page : Page
    }


type Page
    = NotFound
    | Home Home.Model
    | Dex Dex.Model


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    routeToUrl url { key = key, page = NotFound }



---- UPDATE ----


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | HomeMsg Home.Msg
    | DexMsg Dex.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model.page ) of
        ( LinkClicked urlRequest, _ ) ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Cmd.batch
                        [ blurActiveElement ()
                        , Nav.pushUrl model.key (Url.toString url)
                        ]
                    )

                Browser.External href ->
                    ( model, Nav.load href )

        ( UrlChanged url, _ ) ->
            routeToUrl url model

        ( HomeMsg m, Home h ) ->
            routeHome model (Home.update m h)

        ( DexMsg m, Dex d ) ->
            routeDex model (Dex.update m d)

        _ ->
            ( model, Cmd.none )


routeHome : Model -> ( Home.Model, Cmd Home.Msg ) -> ( Model, Cmd Msg )
routeHome model ( home, m ) =
    ( { model | page = Home home }, Cmd.map HomeMsg m )


routeDex : Model -> ( Dex.Model, Cmd Dex.Msg ) -> ( Model, Cmd Msg )
routeDex model ( dex, m ) =
    ( { model | page = Dex dex }, Cmd.map DexMsg m )



---- VIEW ----


view : Model -> Browser.Document Msg
view model =
    case model.page of
        NotFound ->
            Page.view never
                { title = "Not found"
                , attrs = []
                , body = [ text "Page not found." ]
                }

        Home home ->
            Page.view HomeMsg (Home.view home)

        Dex dex ->
            Page.view DexMsg (Dex.view dex)



-- ROUTER


routeToUrl : Url.Url -> Model -> ( Model, Cmd Msg )
routeToUrl url model =
    let
        parser =
            oneOf
                [ route top
                    (routeHome model Home.init)
                , route (s "index.html")
                    (routeHome model Home.init)
                , route (s "dex")
                    (routeDex model Dex.init)
                ]
    in
    case Parser.parse parser url of
        Just answer ->
            answer

        Nothing ->
            ( { model | page = NotFound }, Cmd.none )


route : Parser a b -> a -> Parser (b -> c) c
route parser handler =
    Parser.map handler parser
