#!/usr/bin/env runhaskell

-- Andrew Pennebaker

module Dice where

import GetOptFu (maybeRead)
import System (getProgName, getArgs)
import Random (randomRIO)
import Control.Monad (replicateM)
import Data.Char (toLower)
import Data.List.Split (splitOn)
import Data.String.Utils (join)

pick :: [a] -> IO a
pick xs = (randomRIO (0, length xs - 1)) >>= (return . (xs !!))

data Die
	= Per
	| F
	| Poly Int
	deriving (Eq, Ord, Show, Read)

toDie :: String -> Maybe Die
toDie s = case (tail . map toLower) s of
	"%" -> Just Per
	"f" -> Just F
	s -> case (maybeRead s :: Maybe Int) of
		Just m -> Just $ Poly m
		_ -> Nothing

fromDie :: Die -> String
fromDie die = "d" ++ case die of
	Per -> "%"
	F -> "F"
	Poly m -> show m

d :: Int -> Die -> IO [Int]
d n die = replicateM n $ (pick . faces) die
	where
		faces Per = [10, 20 .. 100]
		faces F = [-1, 0, 1]
		faces (Poly m) = [1 .. m]

roll :: String -> IO (Maybe [Int])
roll dice = do
	let dice' = map toLower dice

	case splitOn "d" dice' of
		[n, die] -> do
			let n' = case n of
				"" -> Just 1
				s -> maybeRead s :: Maybe Int

			let die' = toDie ('d':die)

			case (n', die') of
				(Just n'', Just die'') -> do
					rs <- n'' `d` die''
					return $ Just rs
				_ -> return Nothing
		_ -> return Nothing

formatError :: String
formatError = "Format error: dice should be [integer]<d|D><%|F|integer>"

usage :: String -> IO ()
usage program = do
	putStrLn $ "Usage: " ++ program ++ " [n]<die>\n"

	putStrLn "d%\tPercent"
	putStrLn "dF\tFudge"
	putStrLn "d2\tCoin"
	putStrLn "d6\tCasino"
	putStrLn "d10\tStorytelling System"
	putStrLn "d20\tDungeons & Dragons"
	putStrLn "d<m>\tPolyhedral with m sides"

main :: IO ()
main = do
	program <- getProgName
	args <- getArgs

	case null args of
		True -> usage program
		_ -> do
			rs <- (roll . join " ") args

			putStrLn $ case rs of
				Just rs' -> "Roll: " ++ show rs' ++ " Sum: " ++ (show . sum) rs'
				_ -> formatError