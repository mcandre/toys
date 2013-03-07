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

import Data.Graph.Inductive
import Data.GraphViz

meGraph :: Gr String String
meGraph = mkGraph [(0, "Me")] [(0, 0, "")]

meParams :: GraphvizParams String String () String
meParams = nonClusteredParams {
    globalAttributes = ga,
    fmtNode = fn,
    fmtEdge = fe
  }
  where
    ga = [
      GraphAttrs [
        (BgColor . X11Color) Transparent
        ],
      NodeAttrs [
        Shape Circle,
        PenWidth 0.0,
        (FillColor . X11Color) Yellow,
        Style [SItem Filled []]
        ]
      ]

    fn (n,l) = [(Label . StrLabel) l]
    fe (f,t,l) = [(Label . StrLabel) l]

main :: IO ()
main = putStr . printDotGraph $ graphToDot meParams meGraph
