#!/usr/bin/env runhaskell

-- Requirements
--
-- Haskell
-- bloomfilter

-- Example
--
-- $ runhaskell bloomtest.hs 
-- Jerry in filter? True
-- Kerry in filter? True
-- Larry in filter? True
-- Andy in filter? False
-- Mandy in filter? True
-- Sandy in filter? False

import Data.BloomFilter.Easy

main :: IO ()
main = do
	let fpr = 0.2

	let names = [
			"Barry",
			"Derrick",
			"Jerry",
			"Kerry",
			"Larry",
			"Mary",
			"Terry"
		]

	let bf = easyList fpr names

	let queries = [
			"Jerry",
			"Kerry",
			"Larry",
			"Andy",
			"Mandy", -- Considered in the filter when fpr >= 0.2
			"Sandy"
		]

	mapM_ (\q -> putStrLn $ (show q) ++ " in filter? " ++ show (elemB q bf)) queries