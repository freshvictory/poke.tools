module Page.Dex exposing (Model, Msg, init, update, view)

import Api exposing (Pokemon, Type, test, typeString)
import Css exposing (deg, hex, int, pct, px, rem, vh, vw, num)
import Css.Media as Media
import Dict exposing (Dict)
import Html.Styled as H exposing (Html)
import Html.Styled.Attributes as A exposing (css)
import Page
import Css.Global exposing (media)



-- MODEL


type alias Model =
    { cache : Dict String Pokemon
    }


init : ( Model, Cmd Msg )
init =
    ( { cache =
            Dict.fromList
                [ ( "bulbasaur", test.bulbasaur )
                , ( "ivysaur", test.ivysaur )
                , ( "venusaur", test.venusaur )
                , ( "minccino", test.minccino )
                , ( "cinccino", test.cinccino )
                , ( "ralts", test.ralts )
                , ( "kirlia", test.kirlia )
                , ( "gardevoir", test.gardevoir )
                , ( "gallade", test.gallade )
                ]
      }
    , Cmd.none
    )



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
        , viewContent model
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
                , Css.backgroundColor (hex "#222")
                , Css.borderRadius (rem 0.5)
                , Css.display Css.inlineBlock
                , Css.fontSize (rem 1)
                ]
            ]
            [ H.text "poké.tools" ]
        ]


viewContent : Model -> Html Msg
viewContent model =
    H.div
        [ css
            [ Css.margin (rem 1)
            ]
        ]
        [ viewEntry model test.bulbasaur
        , viewEntry model test.minccino
        , viewEntry model test.ralts
        ]


viewEntry : Model -> Pokemon -> Html Msg
viewEntry model pokemon =
    let
        profileOffset =
            50

        style =
            { entry =
                [ Css.borderRadius (px 25)
                , Css.property "background-color" "var(--c-background-medium)"
                , Css.marginTop (px profileOffset)
                , Css.padding (px 10)
                ]
            , top =
                [ Css.property "display" "grid"
                , Css.property "grid-template-columns" "1fr auto 1fr"
                , Css.justifyContent Css.spaceAround
                , Css.alignItems Css.center
                ]
            , typeList =
                [ Css.property "display" "grid"
                , Css.property "grid-auto-flow" "column"
                , Css.property "column-gap" "0.25rem"
                , Css.justifyContent Css.center
                , Css.transform (Css.rotateZ (deg 30))
                ]
            , typeIcon =
                [ Css.width (rem 2.5)
                , Css.height (rem 2.5)
                , Css.borderRadius (pct 50)
                , Css.property "background" "var(--c-background-medium)"
                , Css.transform (Css.rotateZ (deg -30))
                -- , Css.boxShadow4 (px 2) (px 2) (px 10) (hex "#000")
                , Css.firstChild
                    [ Css.zIndex (int 1)
                    ]
                , Css.nthChild "2"
                    [ Css.marginLeft (rem -1)
                    ]
                , Css.onlyChild
                    [ Css.width (rem 3)
                    , Css.height (rem 3)
                    ]
                ]
            , profile =
                [ Css.width (px 150)
                , Css.height (px 150)
                , Css.padding (px 10)
                , Css.borderRadius (pct 50)
                , Css.marginTop (px -profileOffset)
                , Css.property "background-color" "var(--c-background-light)"
                , Css.boxShadow4 (px 2) (px 2) (px 10) (hex "#000")
                ]
            , profileImg =
                [ Css.width (pct 100)
                , Css.height (pct 100)
                ]
            , number =
                [ Css.fontSize (rem 2)
                , Css.textAlign Css.center
                ]
            , numberSign =
                [ Css.fontSize (rem 1)
                , Css.fontWeight (int 500)
                , Css.verticalAlign Css.super
                , Css.property "color" "var(--c-text-light)"
                ]
            , header =
                [ Css.textAlign Css.center
                , Css.margin2 (rem 1) Css.zero
                ]
            , name =
                [ Css.fontSize (rem 2)
                ]
            , category =
                [ Css.fontVariant Css.smallCaps
                , Css.letterSpacing (px 1)
                ]
            , descriptionList =
                [ Css.property "scroll-snap-type" "x mandatory"
                , Css.displayFlex
                , Css.flexFlow2 Css.row Css.noWrap
                , Css.width (pct 100)
                , Css.overflowX Css.auto
                , Css.property "overscroll-behavior-x" "contain"
                ]
            , descriptionItem =
                [ Css.property "scroll-snap-align" "center"
                , Css.flex Css.none
                , Css.width (pct 100)
                , Css.displayFlex
                , Css.flexDirection Css.column
                , Css.justifyContent Css.center
                , Css.padding (px 5)
                ]
            , description =
                []
            , descriptionText =
                [ Css.fontStyle Css.italic
                , Css.padding (px 10)
                , Css.borderRadius (px 10)
                , Css.property "background-color" "var(--c-background-light)"
                , Css.boxShadow4 (px 2) (px 2) (px 10) (hex "#000")
                ]
            , descriptionVersion =
                [ Css.float Css.right
                , Css.fontSize (rem 0.9)
                , Css.margin (rem 0.25)
                , Css.property "color" "var(--c-text-light)"
                , Css.fontVariant Css.smallCaps
                , Css.letterSpacing (px 1)
                ]
            , evolution =
                [ Css.paddingTop (px 30)
                , Css.paddingBottom (px 20)
                , Css.margin3 (px 40) (px 5) (px 5)
                , Css.borderRadius (px 10)
                , Css.property "background-color" "var(--c-background-light)"
                , Css.boxShadow4 (px 2) (px 2) (px 10) (hex "#000")
                , Css.position Css.relative
                ]
            , evolutionHeader =
                [ Css.fontSize (rem 1.25)
                , Css.position Css.absolute
                , Css.top (rem -1)
                , Css.left (pct 50)
                , Css.transform (Css.translateX (pct -50))
                , Css.property "background-color" "var(--c-background-lightest)"
                , Css.property "color" "var(--c-text-pop)"
                , Css.borderRadius (px 10)
                , Css.padding2 (rem 0.25) (rem 0.5)
                , Css.fontVariant Css.smallCaps
                , Css.letterSpacing (px 1)
                , Css.lineHeight (num 1)
                , Css.boxShadow4 (px 1) (px 1) (px 5) (hex "#000")
                ]
            }
    in
    H.article
        [ css style.entry ]
        [ H.div
            [ css style.top ]
            [ H.ol
                [ css style.typeList ]
                (List.map
                    (\t ->
                        H.li
                            [ css style.typeIcon ]
                            [ viewTypeIcon t ]
                    )
                    pokemon.types
                )
            , H.div
                [ css style.profile ]
                [ H.img
                    [ A.src pokemon.images.hero
                    , css style.profileImg
                    ]
                    []
                ]
            , H.p
                [ css style.number ]
                [ H.span
                    [ css style.numberSign ]
                    [ H.text "#" ]
                , H.text (String.fromInt pokemon.id)
                ]
            ]
        , H.header
            [ css style.header
            ]
            [ H.h1
                [ css style.name ]
                [ H.text pokemon.name ]
            , H.p
                [ css style.category ]
                [ H.text pokemon.category ]
            ]
        , H.ul
            [ css style.descriptionList ]
            (List.map
                (\{ text, version } ->
                    H.li
                        [ css style.descriptionItem ]
                        [ H.p
                            [ css style.description ]
                            [ H.blockquote
                                [ css style.descriptionText ]
                                [ H.text text ]
                            , H.p
                                [ css style.descriptionVersion ]
                                [ H.text ("Pokémon " ++ version) ]
                            ]
                        ]
                )
                pokemon.description
            )
        , H.section
            [ css style.evolution ]
            [ H.h2
                [ css style.evolutionHeader ]
                [ H.text "evolution" ]
            , viewEvolutionChain model pokemon
            ]
        ]


viewEvolutionChain : Model -> Pokemon -> Html Msg
viewEvolutionChain model pokemon =
    let
        style =
            { chains =
                [ Css.property "display" "grid"
                , Css.property "row-gap" "2rem"
                ]
            , chain =
                [ Css.property "display" "grid"
                , Css.property "grid-auto-flow" "column"
                , Css.property "grid-auto-columns" "auto"
                , Css.property "justify-content" "center"
                , Css.property "column-gap" "1rem"
                ]
            , image =
                [ Css.width (px 100)
                , Css.height (px 100)
                , Css.padding (px 10)
                , Css.borderRadius (pct 50)
                , Css.property "background-color" "var(--c-background-medium)"
                , Css.property "box-shadow" "inset 1px 1px 5px #000, 1px 1px 5px #9d9d9d"
                , Css.margin Css.auto
                , Media.withMedia [ Media.only Media.screen [Media.maxWidth (px 400)] ]
                    [ Css.width (px 70)
                    , Css.height (px 70)
                    , Css.padding (px 5)
                    ]
                ]
            , label =
                [ Css.textAlign Css.center
                , Css.fontSize (rem 0.9)
                , Css.property "color" "var(--c-text-pop)"
                , Css.property "background-color" "var(--c-background-lightest)"
                , Css.boxShadow4 (px 1) (px 1) (px 5) (hex "#000")
                , Css.borderRadius (px 10)
                , Css.padding2 (rem 0.25) (rem 0.5)
                , Css.maxWidth Css.maxContent
                , Css.margin Css.auto
                , Css.marginTop (rem -0.5)
                ]
            }
    in
    H.ol
        [ css style.chains ]
        (List.map
            (\chain ->
                H.li
                    []
                    [ H.ol
                        [ css style.chain ]
                        (List.map
                            (\name ->
                                H.li
                                    [ css
                                        []
                                    ]
                                    (case Dict.get name model.cache of
                                        Just p ->
                                            [ H.div
                                                [ css style.image ]
                                                [ H.img
                                                    [ A.src p.images.hero
                                                    , A.alt p.name
                                                    , css
                                                        [ Css.height (pct 100)
                                                        , Css.width (pct 100)
                                                        ]
                                                    ]
                                                    []
                                                ]
                                            , H.p
                                                [ css style.label ]
                                                [ H.text p.name ]
                                            ]

                                        Nothing ->
                                            [ H.text "" ]
                                    )
                            )
                            chain
                        )
                    ]
            )
            pokemon.evolution
        )


viewTypeIcon : Type -> Html Msg
viewTypeIcon t =
    let
        ts =
            typeString t
    in
    H.img
        [ A.class ts
        , A.src ("images/types/" ++ ts ++ ".svg")
        , css
            [ Css.border2 (px 2) Css.solid
            , Css.borderRadius (pct 50)
            , Css.property "border-color" "var(--c-type)"
            , Css.property "box-shadow" "2px 2px 10px #000, 0 0 10px -2px var(--c-type)"
            ]
        ]
        []
