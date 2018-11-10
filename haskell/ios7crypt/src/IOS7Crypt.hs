-- Allows Flag to derive Typeable
{-# LANGUAGE ScopedTypeVariables #-}

-- Requires MissingH, random-fu, and QuickCheck

-- | IOS7Crypt provides symmetric encryption algorithms for legacy routers.
module IOS7Crypt where

import qualified System.Random as Random
import Numeric (showInt, showHex)
import Data.List (intercalate)
import Data.Char (ord, chr, isAscii)
import Data.Bits (xor)
import Data.Maybe (fromJust)

import Control.Parallel.Strategies (parMap, rseq)

import qualified GetOptFu

-- | xlat' is a static key (!)
xlat' :: [Int]
xlat' = [
    0x64, 0x73, 0x66, 0x64, 0x3b, 0x6b, 0x66, 0x6f,
    0x41, 0x2c, 0x2e, 0x69, 0x79, 0x65, 0x77, 0x72,
    0x6b, 0x6c, 0x64, 0x4a, 0x4b, 0x44, 0x48, 0x53,
    0x55, 0x42, 0x73, 0x67, 0x76, 0x63, 0x61, 0x36,
    0x39, 0x38, 0x33, 0x34, 0x6e, 0x63, 0x78, 0x76,
    0x39, 0x38, 0x37, 0x33, 0x32, 0x35, 0x34, 0x6b,
    0x3b, 0x66, 0x67, 0x38, 0x37
    ]

-- | xlat wraps the key.
xlat :: Int -> [Int]
xlat s = (drop s . cycle) xlat'

-- | pad2 left-pads strings.
pad2 :: (Int -> String -> String) -> Int -> String
pad2 f i = take (2 - length s) "0" ++ s
    where s = f i ""

-- | onlyPairs extracts character pairs.
onlyPairs :: String -> [String]
onlyPairs text = take 2 text : if length text <= 3 then
        []
    else
        (onlyPairs . drop 2) text

-- | encrypt' scrambles a password with a given initial seed.
encrypt' :: Int -> String -> String
encrypt' seed password
    | seed < 0 || seed > 15 = encrypt' 0 password
    | otherwise = pad2 showInt seed ++ (intercalate "" . parMap rseq (pad2 showHex) . zipWith xor (xlat seed) . parMap rseq ord) password

-- | encrypt scrambles a password with a random seed.
encrypt :: String -> IO String
encrypt password = do
    seed <- Random.getStdRandom $ Random.randomR (0, 16)
    return $ encrypt' seed password

-- | decrypt reveals plaintext passwords.
decrypt :: String -> Maybe String
decrypt hash
    | length hash < 4 = Just ""
    | otherwise = decrypt' s p
        where
            s = (GetOptFu.maybeRead . take 2) hash
            (p :: [Maybe Int]) = parMap rseq (GetOptFu.maybeRead . ("0x" ++)) ((onlyPairs . drop 2) hash)

            decrypt' :: Maybe Int -> [Maybe Int] -> Maybe String
            decrypt' Nothing _ = Nothing
            decrypt' (Just s') p'
                | Nothing `elem` p' = Nothing
                | otherwise = Just $ (parMap rseq chr . zipWith xor (xlat s') . parMap rseq fromJust) p'

-- | propReversible provides a self-test for encryption symmetry.
propReversible :: Int -> String -> Bool
propReversible seed password
    | filter isAscii password == password = (decrypt . encrypt' seed) password == Just password
    | otherwise = True
