import Data.List
import Data.Char
import Data.Function
import qualified Data.Map as M

-- ! 5.8.1
wordFrequency :: Int -> String -> [([Char], Int)]
wordFrequency n = map (\x -> (head x, length x)) . group . filter ((>n-1) . length) . sortBy (flip compare) . words

-- ! 5.8.2
mostFrequentOfLength :: [Char] -> [(Int, Int)]
mostFrequentOfLength = map (\x -> (head x, length x)) . group . sort . mywords

mywords s =  case dropWhile isSpace s of
  "" -> []
  s' -> length w : mywords s''
        where (w, s'') =
                break isSpace s'

-- ! 5.8.3
wordlist :: String -> [String]
wordlist = map head . group . sort . words

quickst :: Ord a => [a] -> [a]
quickst []     = [] --base case
quickst (x:xs) = quickst lesser ++ [x] ++ quickst greater --recursive case
    where
        lesser  = filter (< x) xs
        greater = filter (>= x) xs

sub :: Eq a => (a, [a]) -> [a]
sub(x,[]) = []
sub(x,y:z) = if x == y then z else y:sub(x,z)

remlist :: Eq a => ([a], [a]) -> [a]
remlist([],x) = x
remlist(x:y,z) = remlist(y,sub(x,z))

ancheck :: Ord a => [a] -> [a] -> Bool
ancheck x y = quickst x == quickst y

-- not named find because of possible duplicates in prelude
find2 :: Ord a => ([a], [[a]]) -> [[a]]
find2 (x,[]) = []
find2 (x, y:z) = if ancheck x y then y:find2(x,z) else find2(x,z)

anagramlist :: Ord a => [[a]] -> [[[a]]]
anagramlist [] = []
anagramlist (x:z) = list:anagramlist(remlist(list,x:z))
              where list = x:find2(x,z)

anagrams :: String -> [[[Char]]]
anagrams x = anagramlist (wordlist x)

{- this 'main' function is only here for the compiled, stand-alone version 
 - calling it from within GHCi is problematic since GHCi itself needs stdin!
 - to compile, run:
 -
 -     ghc -O WordStats 
 -
 - (The -O flag turns on optimizations)
 -}
main :: IO ()
main = onStdin $ wordFrequency 3 -- change this to run a different function from the commandline
  where onStdin f = getContents >>= (mapM_ print . f . filter (\x->isAlphaNum x || isSpace x))
