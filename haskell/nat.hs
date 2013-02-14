#!/usr/bin/env runhaskell

module Nat where

data Nat = Zero | Succ Nat deriving (Eq, Ord)

integer2Nat :: Integer -> Nat
integer2Nat 0 = Zero
integer2Nat n = Succ $ integer2Nat (n - 1)

nat2Integer :: Nat -> Integer
nat2Integer Zero = 0
nat2Integer (Succ n) = 1 + nat2Integer n

instance Show Nat where
	show = show . nat2Integer

instance Num Nat where
	fromInteger = integer2Nat

	(+) x y = fromInteger $ nat2Integer x + nat2Integer y
	(-) x y = fromInteger $ nat2Integer x - nat2Integer y
	(*) x y = fromInteger $ nat2Integer x * nat2Integer y

	negate = id
	abs = id

	signum x = case x of
		Zero -> 0
		_ -> 1

myfib :: Nat -> Nat
myfib 0 = 0
myfib 1 = 1
myfib n = a `seq` b + a
	where
		a = myfib (n - 2)
		b = myfib (n - 1)

main :: IO ()
main = putStrLn . show $ myfib 20