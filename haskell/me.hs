#!/usr/bin/env runhaskell

-- Andrew Pennebaker
--
-- Requirements
--
-- Haskell 2010 (http://haskell.org/)
-- Haskell graphviz (http://hackage.haskell.org/packages/archive/graphviz/latest/doc/html/Data-GraphViz.html)
-- Graphviz (http://www.graphviz.org/)
--
-- Example
--
-- $ ./me.hs > me.dot
-- $ dot -Tpng me.dot > me.png

module Me where

import Data.Text.Lazy (Text, pack, unpack)
import Data.Graph.Inductive (Gr, mkGraph)
import Data.GraphViz (
  GraphvizParams,
  GlobalAttributes(
    GraphAttrs,
    NodeAttrs
    ),
  X11Color(Transparent, Yellow),
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
    FillColor,
    BgColor,
    FontSize,
    PenWidth,
    Shape,
    Label,
    ViewPort,
    Style
    ),
  Shape(Circle),
  Label(StrLabel),
  ViewPort(VP),
  StyleName(Filled),
  StyleItem(SItem),
  toWColor,
  wVal,
  hVal,
  zVal,
  focus
  )

meGraph :: Gr Text Text
meGraph = mkGraph [(0, pack "Me")] [(0, 0, pack "")]

meParams :: GraphvizParams n Text Text () Text
meParams = nonClusteredParams {
    globalAttributes = ga,
    fmtNode = fn,
    fmtEdge = fe
  }
  where
    ga = [
      GraphAttrs [
        BgColor [toWColor Transparent]
        ],
      NodeAttrs [
        Shape Circle,
        PenWidth 0.0,
        FillColor [toWColor Yellow],
        Style [SItem Filled []]
        ]
      ]

    fn (n,l) = [(Label . StrLabel) l]
    fe (f,t,l) = [(Label . StrLabel) l]

main :: IO ()
main = putStr $ unpack $ renderDot $ toDot $ graphToDot meParams meGraph
