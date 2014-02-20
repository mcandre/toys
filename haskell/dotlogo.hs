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
-- $ ./dotlogo.hs > dot.dot
-- $ neato -Tsvg dot.dot > dot.svg

module DotLogo where

import Data.Text.Lazy (Text, pack, unpack)
import Data.Graph.Inductive
import Data.GraphViz
import Data.GraphViz.Printing
import Data.GraphViz.Attributes.Complete

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
