module Main where

data Color
    = Green
    | Red
    | Blue
    | White
    | Black
    deriving (Eq, Ord, Show, Read)

complain :: Color -> String
complain c = case c of
    Green -> "Too green!"
    Red -> "Too red!"
    Blue -> "Not green enough!"
    White -> "Too light!"
    Black -> "Too dark!"

main :: IO ()
main = let
    green = Green :: Color
    red = Red :: Color
    blue = Black :: Color
    white = White :: Color
    black = Black :: Color
    in do
        print green
        print red
        print blue

        print ""

        print $ complain green
        print $ complain red
        print $ complain blue
        print $ complain white
        print $ complain black
