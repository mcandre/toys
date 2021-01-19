-- | ROT13 provides a caesar shift with a static key.
module ROT13 where

import Data.Char (ord, chr, isAsciiLower, isAsciiUpper, isAscii)

-- | littleA models a lowercase A in ASCII.
littleA :: Int
littleA = ord 'a'

-- | littleZ models a lowercase Z in ASCII.
littleZ :: Int
littleZ = ord 'z'

-- | bigA models an uppercase A in ASCII.
bigA :: Int
bigA = ord 'A'

-- | bigZ models an uppercase Z in ASCII.
bigZ :: Int
bigZ = ord 'Z'

-- | rot13Char symmetrically encrypts an ASCII character.
rot13Char :: Char -> Char
rot13Char c
    | isAsciiLower c = rot littleA c
    | isAsciiUpper c = rot bigA c
    | otherwise = c
    where
        rot :: Int -> Char -> Char
        rot r = chr . (r +) . flip mod 26 . (13 +) . flip (-) r . ord

-- | rot13 symmetrically encrypts a string.
rot13 :: String -> String
rot13 = map rot13Char

-- | propReversible tests cipher symmetry.
propReversible :: String -> Bool
propReversible text
    | filter isAscii text == text = (rot13 . rot13) text == text
    | otherwise = True
