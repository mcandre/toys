#!/usr/bin/env runhaskell

Tweet tweet! This is bird.lhs, an example of literate programming.
This style of coding emphasizes text over computer instructions.

> main :: IO ()
> main = putStrLn "Tweet tweet!"

The code in this document can be run in a shell by entering:

runhaskell bird.lhs
Tweet tweet!

In Unix systems, including Mac OS X and Linux, the code can also be run by marking this document as executable and using dot slash notation:

chmod a+x bird.lhs
./bird.lhs
Tweet tweet!

This document uses bird style literate syntax, named after Richard Bird.