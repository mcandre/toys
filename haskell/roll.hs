#!/usr/bin/env runhaskell

-- Andrew Pennebaker

module Roll where

import System (getProgName, getArgs)
import System.Exit (exitSuccess)
import Random (randomRIO)
import Control.Monad (replicateM, when)
import Maybe (fromMaybe)
import Data.Char (toLower)
import Data.List.Split (splitOn)
import Data.String.Utils (join)

pick :: [a] -> IO a
pick xs = randomRIO (0, length xs - 1) >>= return . (xs !!)

-- Thanks to aavogt at #haskell
maybeRead :: Read a => String -> Maybe a
maybeRead s = case reads s of
	(r, ""):[] -> Just r
	_ -> Nothing

data Die
	= Per
	| F
	| Poly Int
	deriving (Eq, Ord, Show, Read)

toDie :: String -> Maybe Die
toDie s = case (tail . map toLower) s of
	"%" -> Just Per
	"f" -> Just F
	s -> (maybeRead s :: Maybe Int) >>= Just . Poly

fromDie :: Die -> String
fromDie die = "d" ++ case die of
	Per -> "%"
	F -> "F"
	Poly m -> show m

-- Roll n dice
d :: Int -> Die -> IO [Int]
d n die = replicateM n $ (pick . faces) die
	where
		faces Per = [10, 20 .. 100]
		faces F = [-1, 0, 1]
		faces (Poly m) = [1 .. m]

-- Parse and roll n dice
roll' :: String -> IO (Maybe [Int])
roll' dice = do
	let dice' = map toLower dice

	case splitOn "d" dice' of
		[n, die] -> do
			let n' = case n of
				"" -> Just 1
				s -> maybeRead s :: Maybe Int

			let die' = toDie ('d':die)

			case (n', die') of
				(Just n'', Just die'') -> n'' `d` die'' >>= return . Just
				_ -> return Nothing

		-- Constant modifier
		[c] -> case (maybeRead c :: Maybe Int) of
			Just c' -> (return . Just) [c']
			_ -> return Nothing

		_ -> return Nothing

-- Parse and roll groups of dice
roll :: String -> IO (Maybe [Int])
roll dice = do
	let dice' = (filter (/= "") . splitOn "+" . join "" . splitOn " ") dice
	rs <- mapM roll' dice'

	if Nothing `elem` rs
		then return Nothing
		else (return . Just . concat . map (fromMaybe [])) rs

usage :: String -> IO ()
usage program = do
	putStrLn $ "Usage: " ++ program ++ " [n]<die> [+ [n]<die>...]\n"

	putStrLn "d%\tPercent"
	putStrLn "dF\tFudge"
	putStrLn "d2\tCoin"
	putStrLn "d6\tCasino"
	putStrLn "d10\tStorytelling System"
	putStrLn "d20\tDungeons & Dragons"
	putStrLn "d<m>\tPolyhedral with m sides"
	putStrLn "<c>\tConstant modifier"

	exitSuccess

main :: IO ()
main = do
	program <- getProgName
	args <- getArgs

	when ((null args) || ("-h" `elem` args) || ("--help" `elem` args))
		(do
			usage program)

	rs <- (roll . join " ") args

	case rs of
		Just rs' -> putStrLn $ "Roll: " ++ show rs' ++ " Sum: " ++ (show . sum) rs'
		_ -> usage program