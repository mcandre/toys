#!/usr/bin/env runhaskell

{-

FreeBSD License

Copyright 2010 Andrew Pennebaker. All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation and/or
other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE AUTHORS "AS IS" AND ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
SHALL THE AUTHORS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Based on Better Off Ted's episode, The Impertence of Communicationizing.

Transcript:

Phil: Anyway, it's really quite simple. You take a person's most marked physical feature, compare it to genitalia--male, female, or animal--and end with the suffix "-bag," "-wipe", or "-muncher."
Lem: You could also add an optional reference to excretion from any of the glorious openings offered by the human body.
Phil: Shall we take it for a spin?
Phil: Excuse me Roger? Your head looks like a lizard butt-flap you ass-wipe.
Phil and Lem: Ooh!

Phil: Your eyes look like two beady rabbit pellets on the face of a monkey-licking pus-bomb.
Lem: You've just been Phil-abusted.
Phil: Nice!
[Chest Bump]

Bonus suffixes from the Really Vulgar Outtakes
http://www.youtube.com/watch?v=Bh7Nz4bIwss

-}

module Philabuster where

import Data.Random
import Data.Random.Source.DevRandom
import Data.Random.List (randomElement)

features = ["head looks like", "eyes look like", "face looks like"]
animals = ["lizard", "rabbit", "monkey"]
genitalia = ["butt-flaps", "pellets"]
excretions = ["ass", "pus"]
suffixes = ["bag", "wipe", "muncher", "bomb", "tard", "gobbler", "fucker", "sucker", "diddler", "slurper", "gurgler", "queefer", "puffer", "knuckler", "nuzzler", "jacker", "groper", "twister", "felcher"]

philabuster :: IO String
philabuster = do
	feature <- runRVar (randomElement features) DevRandom
	species <- runRVar (randomElement animals) DevRandom
	genital <- runRVar (randomElement genitalia) DevRandom
	excretion <- runRVar (randomElement excretions) DevRandom
	suffix <- runRVar (randomElement suffixes) DevRandom

	return $ "Your " ++ feature ++ " " ++ species ++ " " ++ genital ++ ", you " ++ excretion ++ "-" ++ suffix ++ "!"

main :: IO ()
main = do
	p <- philabuster
	putStrLn p