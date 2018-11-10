-- Example
--
-- $ gnomes > gnomes.dot
-- $ dot -Tpng gnomes.dot > gnomes.png

module Main where

import Data.Text.Lazy (Text, pack, unpack)
import Data.Graph.Inductive (Gr, mkGraph)
import Data.GraphViz (
    GraphvizParams,
    GlobalAttributes(
        GraphAttrs,
        NodeAttrs
        ),
    X11Color(Transparent, White),
    nonClusteredParams,
    globalAttributes,
    fmtNode,
    fmtEdge,
    graphToDot
    )
import Data.GraphViz.Printing (toDot, renderDot)
import Data.GraphViz.Attributes.Complete (
    DPoint(DVal),
    Attribute(
        Margin,
        Pad,
        Center,
        BgColor,
        FontSize,
        Shape,
        Label,
        ViewPort,
        RankDir,
        Style,
        FillColor
        ),
    Shape(Circle, BoxShape),
    Label(StrLabel),
    ViewPort(VP),
    RankDir(FromLeft),
    StyleName(Filled),
    StyleItem(SItem),
    toWColor,
    wVal,
    hVal,
    zVal,
    focus
    )

gnomes :: Gr Text Text
gnomes = mkGraph [(1, pack "Collect underpants"), (3, pack "Profit")] [(1, 3, pack "?")]

gnomeParams :: GraphvizParams n Text Text () Text
gnomeParams = nonClusteredParams {
    globalAttributes = ga,
    fmtNode = fn,
    fmtEdge = fe
    }
    where
        ga = [
            GraphAttrs [
                RankDir FromLeft,
                BgColor [toWColor Transparent]
                ],
            NodeAttrs [
                Shape BoxShape,
                FillColor [toWColor White],
                Style [SItem Filled []]
                ]
            ]

        fn (n,l) = [(Label . StrLabel) l]
        fe (f,t,l) = [(Label . StrLabel) l]

main :: IO ()
main = putStr $ unpack $ renderDot $ toDot $ graphToDot gnomeParams gnomes
