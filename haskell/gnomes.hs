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

import Data.Graph.Inductive
import Data.GraphViz

gnomes :: Gr String String
gnomes = mkGraph [(1, "Collect underpants"), (3, "Profit")] [(1, 3, "?")] :: Gr String String

gnomeParams :: GraphvizParams String String () String
gnomeParams = nonClusteredParams {
		globalAttributes = ga,
		fmtNode = fn,
		fmtEdge = fe
	}
	where
		ga = [
			GraphAttrs [
				RankDir FromLeft,
				(BgColor . X11Color) Transparent
				],
			NodeAttrs [
				Shape BoxShape,
				(FillColor . X11Color) White,
				Style [SItem Filled []]
				]
			]

		fn (n,l) = [(Label . StrLabel) l]
		fe (f,t,l) = [(Label . StrLabel) l]

main :: IO ()
main = putStr . printDotGraph $ graphToDot gnomeParams gnomes