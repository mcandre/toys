module Main where

wordCount :: String -> String
wordCount input = "Lines: " ++ show (length (lines input)) ++ "\n" ++
    "Words: " ++ show (length (words input)) ++ "\n" ++
    "Chars: " ++ show (length input) ++ "\n"

main :: IO ()
main = interact wordCount
