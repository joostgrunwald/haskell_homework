module Obfuscate where

import Data.Char

-- ? Shuffle imports
import Control.Monad (replicateM)
import Data.Function (on)
import Data.List     (sortBy)


meme :: String
meme = "According to research at Cambridge university, it doesn't matter\
       \ what order the letters in a word are, the only important thing is\
       \ that the first and last letters are at the right place. The rest can\
       \ be a total mess and you can still read it without a problem. This is\
       \ because we do not read every letter by it self but the word as a wohle."

-- ! This function is made to generate the actual string list
toWords :: String -> [String]
toWords "" = []  -- * An empty string should result in an empty list
toWords s = buildWord s "" -- ? An non empty string should be converted

-- ! This function is made to build a word, it does all the hard work 
buildWord :: String -> String -> [String]
buildWord "" ""   = []     -- ? If there is no word, append nothing to list (emtpy set)
buildWord "" word = [word] -- ? If there is a word, append to list (singleton set)
buildWord (x:xs) word      -- ? In all other cases:
       | x == ',' || x == '.' = word : [x] : buildWord xs ""  -- * Handle punctuation marks seperately
       | x == ' '             = word : buildWord xs "" -- * skip whitespace
       | otherwise            = buildWord xs (word ++ [x]) -- * continue 

cambridge :: String -> String
cambridge: map cambridgeWord buildWord meme

-- ! This function iterates over the words in the list
cambridgeWord :: String -> String
cambridgeWord "" = "" -- * Base case: Empty words stay empty words
cambridgeWord (x:xs) word -- ? In all other cases:
       | x == head word || x == last word = word : [x] : cambridgeWord xs ""
       | otherwise = word : [x] : cambridgeWord xs "" --TODO implement scrambling for these letters
       -- ! https://stackoverflow.com/questions/14692059/how-to-shuffle-a-list

-- A random seed to make results reproducable (scientific method)
seed :: Int
seed = 3
