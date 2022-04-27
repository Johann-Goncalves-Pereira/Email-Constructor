module Pages.Home_ exposing (Model, Msg, page)

import Components.Svg as SVG exposing (Logo(..))
import Gen.Params.Home_ exposing (Params)
import Gen.Route as Route
import Html exposing (Attribute, Html, a, div, em, h1, h2, h5, img, p, section, table, tbody, td, text, tfoot, th, thead, tr)
import Html.Attributes exposing (align, alt, attribute, class, href, id, rel, src, style, tabindex, target)
import Html.Attributes.Aria exposing (ariaLabel, ariaLabelledby)
import Page
import Request
import Shared
import Svg exposing (desc)
import Svg.Attributes exposing (height)
import View exposing (View, placeholder)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }



-- INIT


type alias Model =
    {}


init : Model
init =
    {}



-- UPDATE


type Msg
    = ReplaceMe


update : Msg -> Model -> Model
update msg model =
    case msg of
        ReplaceMe ->
            model



-- VIEW


valign : String -> Attribute msg
valign attr =
    attribute "valign" attr


colspan : Int -> Attribute msg
colspan attr =
    attribute "colspan" <| String.fromInt attr


view : Model -> View Msg
view model =
    { title = "Revex - Home"
    , body = [ viewPage model ]
    }


viewPage : Model -> Html Msg
viewPage model =
    table [ align "center", class "main-table" ]
        [ thead []
            [ tr []
                [ th [ class "logo", align "center" ]
                    [ a [ href "#" ]
                        [ img [ alt "Materialize Logo", src "https://app.materialize.pro/images/logo-materialize-horizontal.svg" ]
                            []
                        ]
                    ]
                ]
            ]
        , tbody []
            [ tr []
                [ td [ class "subtitle", align "center" ]
                    [ text "Olá "
                    , em [] [ text "(nome do cliente)" ]
                    , text ", segue seu resumo diário da Materialize."
                    ]
                ]
            , tr []
                [ viewTableGrey
                ]
            ]
        , tfoot [ class "main-tfoot" ]
            [ tr [] [ td [] [ text "Abraços," ] ]
            , tr [] [ td [ class "td--materialize" ] [ text "Time Materialize" ] ]
            ]
        ]


viewTableGrey : Html Msg
viewTableGrey =
    td [ align "center", class "container-grey" ]
        [ table [ class "container-grey__table" ]
            [ thead []
                [ tr []
                    [ th []
                        [ table []
                            [ thead []
                                [ tr [ class "thead" ]
                                    [ th []
                                        [ text "Sala:" ]
                                    , th [ class "thead--big" ]
                                        [ text "Nome da sala" ]
                                    , th [ class "thead--space" ]
                                        []
                                    , th []
                                        [ text "Total do período:" ]
                                    , th [ class "thead--big" ]
                                        [ text "6h18min" ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            , tbody []
                [ viewTableDark
                , viewTableDark
                ]
            ]
        ]


viewTableDark : Html Msg
viewTableDark =
    tr []
        [ td [ class "container-dark", align "center", colspan 5 ]
            [ table [ class "container-dark__table" ]
                [ thead []
                    [ tr [ class "tr-table" ]
                        [ th [ align "left" ]
                            [ text "Resumo de ontem: "
                            , em []
                                [ text "03/01/2022" ]
                            ]
                        ]
                    ]
                , tbody []
                    [ tr []
                        [ viewTableGrid
                        ]
                    ]
                ]
            ]
        ]


viewTableGrid : Html Msg
viewTableGrid =
    let
        spaceImage =
            "56px"
    in
    td [ class "container-grid" ]
        [ table [ class "container-grid__table" ]
            [ thead [ class "container-grid__header" ]
                [ tr []
                    [ th [ attribute "width" spaceImage ]
                        []
                    , th [ align "left" ]
                        [ text "ESPECIALISTA" ]
                    , th [ align "center" ]
                        [ text "PERÍODOS RESERVADOS" ]
                    , th [ align "center" ]
                        [ text "PERMANÊNCIA NA SALA" ]
                    , th [ align "center" ]
                        [ text "TOTAL DE HORAS REALIZADAS" ]
                    ]
                ]
            , tbody [ class "container-grid__body" ] <|
                viewInfoRow spaceImage
            ]
        ]


viewInfoRow : String -> List (Html Msg)
viewInfoRow h =
    List.map
        (\{ image, name, special, timeStart, timeEnd, timeTotal } ->
            [ tr []
                [ td [ align "center", colspan 2 ]
                    [ table [ class "user", align "left" ]
                        [ tr []
                            [ td
                                [ class "user__photo"
                                , attribute "rowspan" "2"
                                , attribute "style" <| String.concat [ "width:", h ]
                                ]
                                [ img [ alt "Photo Specialist", src image, attribute "height" h ]
                                    []
                                ]
                            , td [ align "left", class "user__name" ]
                                [ text name ]
                            ]
                        , tr []
                            [ td [ align "left", class "user__type" ]
                                [ text special ]
                            ]
                        ]
                    ]
                , td [ align "center", valign "middle" ]
                    [ table []
                        [ tr []
                            [ td [ align "center" ]
                                [ text timeStart ]
                            ]
                        , tr []
                            [ td [ align "center", class "space-top" ]
                                [ text timeEnd ]
                            ]
                        ]
                    ]
                , td [ align "center", valign "middle" ]
                    [ table []
                        [ tr []
                            [ td [ align "center" ]
                                [ text timeStart ]
                            ]
                        , tr []
                            [ td [ align "center", class "space-top" ]
                                [ text timeEnd ]
                            ]
                        ]
                    ]
                , td [ align "center", class "td--materialize", valign "middle" ]
                    [ text timeTotal ]
                ]
            , tr []
                [ td [ class "line", colspan 5 ]
                    []
                ]
            ]
        )
        [ { image = "https://picsum.photos/200/300"
          , name = "Vanessa Freire"
          , special = "(Product Owner)"
          , timeStart = "09:00 - 11:00"
          , timeEnd = "11:00 - 13:00"
          , timeTotal = "3h:18min"
          }
        , { image = "https://picsum.photos/300/700"
          , name = "Maycon Sandos de Oliveira"
          , special = "Designer and Producer"
          , timeStart = "09:00 - 11:00"
          , timeEnd = "11:00 - 13:00"
          , timeTotal = "3h:18min"
          }
        , { image = "https://picsum.photos/700/400"
          , name = "Raphael Derosso Pereira"
          , special = "Software Engineer"
          , timeStart = "09:00 - 11:00"
          , timeEnd = "11:00 - 13:00"
          , timeTotal = "3h:18min"
          }
        ]
        |> List.concat
