module Page.Home exposing (Model, Msg, init, update, view)

import Css exposing (center, hex, pct, px, rem, vh, vw)
import Html.Styled as H exposing (Html)
import Html.Styled.Attributes as A exposing (css)
import Page



-- MODEL


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Page.Details Msg
view model =
    { title = "Poké Tools"
    , attrs = []
    , body =
        [ viewHeader
        , viewContent
        ]
    }


viewHeader : Html Msg
viewHeader =
    H.header
        [ css
            [ Css.margin (rem 1)

            -- , Css.marginBottom Css.zero
            ]
        ]
        [ H.nav
            []
            []
        , H.h1
            [ css
                [ Css.fontWeight Css.normal
                , Css.padding (rem 0.5)

                -- , Css.border3 (px 2) Css.solid (hex "#eee")
                , Css.backgroundColor (hex "#222")

                -- , Css.borderBottom Css.zero
                , Css.borderRadius (rem 0.5)
                , Css.display Css.inlineBlock
                , Css.fontSize (rem 1)
                ]
            ]
            [ H.text "poké.tools"
            ]
        ]


viewContent : Html Msg
viewContent =
    H.div
        [ css
            [ Css.margin (rem 1)

            -- , Css.marginTop Css.zero
            ]
        ]
        [ toolGrid
        ]


toolGrid : Html Msg
toolGrid =
    H.ul
        [ css
            [ Css.property "display" "grid"
            , Css.property "grid-template-columns" "calc(50vw - 1.5rem) calc(50vw - 1.5rem)"
            , Css.property "grid-auto-rows" "calc(50vh - 1.5rem)"
            , Css.property "gap" "1rem"

            -- , Css.border3 (px 2) Css.solid (hex "#eee")
            -- , Css.padding (rem 1)
            , Css.justifyContent Css.center
            ]
        ]
        (List.map
            (\( link, label ) ->
                H.li
                    []
                    [ toolLink link label ]
            )
            [ ( "/", "Type list" )
            , ( "/dex", "Pokédex" )
            ]
        )


toolLink : String -> String -> Html Msg
toolLink link label =
    H.a
        [ A.href link
        , css
            [ Css.width (pct 100)
            , Css.height (pct 100)
            , Css.displayFlex
            , Css.justifyContent Css.center
            , Css.alignItems Css.center
            , Css.borderRadius (rem 0.5)

            -- , Css.fontSize (rem 1)
            -- , Css.property "background" "repeating-linear-gradient(50deg, #222, #222 2px, black 2px, black 12px)"
            -- , Css.borderLeft2 (vw 3) Css.solid
            , Css.backgroundColor (hex "#222")
            ]
        ]
        [ H.span
            []
            [ H.text label
            ]
        ]
