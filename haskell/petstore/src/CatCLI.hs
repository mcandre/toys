module Main where

import qualified Cat as C

main :: IO ()
main = let
    odie = Nothing :: Maybe C.Cat
    c1 = C.Cat "Whiskers" 8.0 "Prof. Boring"
    c2 = C.Cat "Garfield" 11.5 "Jon Arbuckle"
    c3 = C.Cat "Galeanthrope" 7.0 "Nero"
  in do
    putStrLn $ "Odie = " ++ show odie
    putStrLn $ "C1 = " ++ show c1
    putStrLn $ "C2 = " ++ show c2
    putStrLn $ "C3 = " ++ show c3

    putStrLn "\nCatapulting Odie..."
    putStrLn $ C.catapult odie

    putStrLn $ "\nCatapulting " ++ C.name c1 ++ "..."
    putStrLn $ C.catapult (Just c1)

    putStrLn $ "\nCatapulting " ++ C.name c2 ++ "..."
    putStrLn $ C.catapult (Just c2)

    putStrLn $ "\nCatapulting " ++ C.name c3 ++ "..."
    putStrLn $ C.catapult (Just c3)
