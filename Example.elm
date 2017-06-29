module Main exposing (..)

import Html exposing (Html, div, p, text)
import Html.Attributes exposing (style)
import ElementRelativeMouseEvents as Events exposing (Point)


-- MAIN --


main : Program Never (Maybe Point) Msg
main =
    Html.beginnerProgram
        { model = Nothing 
        , update = update
        , view = view
        }


-- TYPES --


type Msg
    = Click Point



-- UPDATE --


update : Msg -> Maybe Point -> Maybe Point
update msg maybePoint =
    case msg of
        Click point ->
            Just point


-- VIEW



view : Maybe Point -> Html Msg
view maybePoint =
    div
        []
        [ p [] [ text "Click on this blue div"]
        , div
            [ style
                [ ("margin-left", "40px")
                , ("margin-top", "40px")
                , ("margin-bottom", "40px")
                , ("width", "200px")
                , ("height", "200px")
                , ("background", "#0000ff")
                ]
            , Events.onClick Click
            ]
            []
        , pointView maybePoint
        ]


pointView : Maybe Point -> Html Msg
pointView maybePoint =
    case maybePoint of
        Nothing ->
            p [] [ text "No click yet" ]

        Just { x, y } ->
            p [] [ text (pointText x y )]


pointText : Float -> Float -> String
pointText x y =
    "Last click was at (" ++ (toString x) ++ ", " ++ (toString y) ++ ")"