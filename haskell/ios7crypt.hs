#!/usr/bin/env runhaskell

-- Allows Flag to derive Typeable and Data
{-# LANGUAGE ScopedTypeVariables, DeriveDataTypeable #-}

-- Andrew Pennebaker
-- andrew.pennebaker@gmail.com
-- 30 Nov 2010
--
-- Requires MissingH, random-fu, and QuickCheck

module IOS7Crypt where

import Data.Random
import Data.Random.Source.IO
import Numeric (showInt, showHex)
import Data.List (intercalate)
import Data.Char (ord, chr)
import Bits (xor)
import Test.QuickCheck hiding (sample)
import Data.Maybe (fromJust)
import Control.Monad (when)

import Control.Parallel.Strategies
import Control.Parallel

import GetOptFu

xlat' = [
	0x64, 0x73, 0x66, 0x64, 0x3b, 0x6b, 0x66, 0x6f,
	0x41, 0x2c, 0x2e, 0x69, 0x79, 0x65, 0x77, 0x72,
	0x6b, 0x6c, 0x64, 0x4a, 0x4b, 0x44, 0x48, 0x53,
	0x55, 0x42, 0x73, 0x67, 0x76, 0x63, 0x61, 0x36,
	0x39, 0x38, 0x33, 0x34, 0x6e, 0x63, 0x78, 0x76,
	0x39, 0x38, 0x37, 0x33, 0x32, 0x35, 0x34, 0x6b,
	0x3b, 0x66, 0x67, 0x38, 0x37
	]

xlat :: Int -> [Int]
xlat s = (drop s . cycle) xlat'

-- Based on Martin Grabmueller's Harpy.X86Disassembler
-- http://hackage.haskell.org/packages/archive/harpy/0.4/doc/html/src/Harpy-X86Disassembler.html
pad2 :: (Int -> String -> String) -> Int -> String
pad2 f i = take (2 - length s) "0" ++ s
	where s = f i ""

onlyPairs :: String -> [String]
onlyPairs text = take 2 text : if length text <= 3 then
		[]
	else
		(onlyPairs . drop 2) text

encrypt' :: Int -> String -> String
encrypt' seed password
	| seed < 0 || seed > 15 = encrypt' 0 password
	| otherwise = pad2 showInt seed ++ (intercalate "" . (parMap rseq) (pad2 showHex) . zipWith xor (xlat seed) . (parMap rseq) ord) password

encrypt :: String -> IO String
encrypt password = do
	seed <- sample (randomElement [0..16])
	return $ encrypt' seed password

decrypt :: String -> Maybe String
decrypt hash
	| length hash < 4 = Just ""
	| otherwise = decrypt' s p
		where
			s = (maybeRead . take 2) hash
			(p :: [Maybe Int]) = (parMap rseq) (maybeRead . ("0x" ++)) ((onlyPairs . drop 2) hash)

			decrypt' :: Maybe Int -> [Maybe Int] -> Maybe String
			decrypt' Nothing _ = Nothing
			decrypt' (Just s) p
				| Nothing `elem` p = Nothing
				| otherwise = Just $ ((parMap rseq) chr . zipWith xor (xlat s) . (parMap rseq) fromJust) p

propReversible :: Int -> String -> Bool
propReversible seed password = (decrypt . encrypt' seed) password == Just password

data Flag
	= Encrypt String
	| Decrypt String
	| Test
	| Help
	deriving (Eq, Ord, Show, Read, Typeable, Data)

options :: [OptDescr Flag]
options = [
	Option "e" ["encrypt"] (ReqArg Encrypt "<password>") "Encrypt a password",
	Option "d" ["decrypt"] (ReqArg Decrypt "<hash>") "Decrypt a hash",
	Option "t" ["test"] (NoArg Test) "Unit test IOS7Crypt",
	Option "h" ["help"] (NoArg Help) "Display usage information"
	]

main :: IO ()
main = do
	program <- getProgName
	args <- getArgs
	pArgs <- parseOpts program args options

	let justTheArgs = fst pArgs

	when (null justTheArgs || getOption pArgs Help == Just Help)
		(do
			putStrLn $ usageInfo program options
			exitSuccess)

	-- Only the first command is observed.
	case head justTheArgs of
		(Encrypt password) -> encrypt password >>= putStrLn
		(Decrypt hash) -> case decrypt hash of
			Just password -> putStrLn password
			_ -> putStrLn "Invalid hash."
		Test -> quickCheck propReversible