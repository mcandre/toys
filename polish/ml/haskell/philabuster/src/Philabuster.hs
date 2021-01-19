{-

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

Requires MissingH and random-fu

-}

module Main where

import qualified System.Random as Random
import qualified System.Random.Shuffle as Shuffle

features :: [String]
features = ["head looks like", "eyes look like", "face looks like"]

animals :: [String]
animals = ["lizard", "rabbit", "monkey"]

genitalia :: [String]
genitalia = ["butt-flap", "pellets"]

excretions :: [String]
excretions = ["ass", "pus"]

suffixes :: [String]
suffixes = ["bag", "wipe", "muncher", "bomb", "tard", "gobbler", "fucker", "sucker", "diddler", "slurper", "gurgler", "queefer", "puffer", "knuckler", "nuzzler", "jacker", "groper", "twister", "felcher"]

philabuster :: IO String
philabuster = do
    stdGen <- Random.getStdGen

    let feature = head $ Shuffle.shuffle' features (length features) stdGen
    let species = head $ Shuffle.shuffle' animals (length animals) stdGen
    let genital = head $ Shuffle.shuffle' genitalia (length genitalia) stdGen
    let excretion = head $ Shuffle.shuffle' excretions (length excretions) stdGen
    let suffix = head $ Shuffle.shuffle' suffixes (length suffixes) stdGen

    return $ "Your " ++ feature ++ " " ++ species ++ " " ++ genital ++ ", you " ++ excretion ++ "-" ++ suffix ++ "!"

main :: IO ()
main = putStrLn =<< philabuster
