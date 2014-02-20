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
-- $ ./gnomes.hs > gnomes.dot
-- $ dot -Tpng gnomes.dot > gnomes.png

module Gnomes where

import Data.Text.Lazy (Text, pack, unpack)
import Data.Graph.Inductive
import Data.GraphViz
import Data.GraphViz.Printing
import Data.GraphViz.Attributes.Complete

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
