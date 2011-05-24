#!/usr/bin/env runhaskell

module Petstore where

import Cat hiding (main)
import Dog

blaspheme :: Cat -> Dog
blaspheme (Cat name weight owner) = Dog name weight owner

main :: IO ()
main = do
	let jerry = Cat "Jerry" 5 "Tom"
	let rover = Dog "Rover" 10 "Col. Husky"

	putStrLn $ show $ Dog.name (blaspheme jerry)
	putStrLn $ show $ Dog.name rover