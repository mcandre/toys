-- Andrew Pennebaker
--
-- Requirements
--
-- Haskell 2010 (http://haskell.org/)
-- Graphviz (http://www.graphviz.org/)
--
-- Currently broken, unfortunately, as Hackage's graphviz dependency tree
-- has not kept up with GHC releases.
--
-- Example
--
-- $ dotlogo > dot.dot
-- $ neato -Tsvg dot.dot > dot.svg

module Main where

import Data.Text.Lazy (Text, pack, unpack)
import Data.Graph.Inductive (Gr, mkGraph)
import Data.GraphViz (
  GraphvizParams,
  GlobalAttributes(
    GraphAttrs,
    NodeAttrs
    ),
  X11Color(Transparent),
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
    ViewPort
    ),
  Shape(Circle),
  Label(StrLabel),
  ViewPort(VP),
  toWColor,
  wVal,
  hVal,
  zVal,
  focus
  )

dotLogoGraph :: Gr Text Text
dotLogoGraph = mkGraph [(0, pack "D"), (1, pack "O"), (2, pack "T")] [(0, 1, pack ""), (1, 2, pack ""), (2, 0, pack "")]

dotParams :: GraphvizParams n Text Text () Text
dotParams = nonClusteredParams {
  globalAttributes = ga,
  fmtNode = fn,
  fmtEdge = fe
  }
  where
    ga = [
      GraphAttrs [
         Center True,
         BgColor [toWColor Transparent],
         (Margin . DVal) 0.0,
         (Pad . DVal) 0.0,
         -- 156.25 pixels
         ViewPort VP { wVal = 125.0, hVal = 125.0, zVal = 1.0, focus = Nothing }
         ],
      NodeAttrs [
        Shape Circle,
        FontSize 26.0
        ]
      ]

    fn (n,l) = [(Label . StrLabel) l]
    fe (f,t,l) = [(Label . StrLabel) l]

main :: IO ()
main = putStr $ unpack $ renderDot $ toDot $ graphToDot dotParams dotLogoGraph
