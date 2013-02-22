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

import Data.Graph.Inductive
import Data.GraphViz

dotLogoGraph :: Gr String String
dotLogoGraph = mkGraph [(0, "D"), (1, "O"), (2, "T")] [(0, 1, ""), (1, 2, ""), (2, 0, "")]

dotParams :: GraphvizParams String String () String
dotParams = nonClusteredParams {
		globalAttributes = ga,
		fmtNode = fn,
		fmtEdge = fe
	}
	where
		ga = [
			GraphAttrs [
				Center True,
				(BgColor . X11Color) Transparent,
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
main = putStr . printDotGraph $ graphToDot dotParams dotLogoGraph