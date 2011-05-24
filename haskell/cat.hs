#!/usr/bin/env runhaskell

module Cat where

data Cat = Cat {
	name :: String,
	weight :: Double,
	owner :: String
} deriving (Eq, Ord, Show, Read)

catapult :: Maybe Cat -> String
catapult (Just c) = "Pull!\n" ++ name c ++ " says 'Meow!'"
catapult _ = "Nothing happened."

main :: IO ()
main = let
		odie = Nothing :: Maybe Cat
		c1 = Cat "Whiskers" 8.0 "Prof. Boring"
		c2 = Cat "Garfield" 11.5 "Jon Arbuckle"
		c3 = Cat "Galeanthrope" 7.0 "Nero"
	in do
		putStrLn $ "Odie = " ++ show odie
		putStrLn $ "C1 = " ++ show c1
		putStrLn $ "C2 = " ++ show c2
		putStrLn $ "C3 = " ++ show c3

		putStrLn "\nCatapulting Odie..."
		putStrLn $ catapult odie

		putStrLn $ "\nCatapulting " ++ name c1 ++ "..."
		putStrLn $ catapult (Just c1)

		putStrLn $ "\nCatapulting " ++ name c2 ++ "..."
		putStrLn $ catapult (Just c2)

		putStrLn $ "\nCatapulting " ++ name c3 ++ "..."
		putStrLn $ catapult (Just c3)