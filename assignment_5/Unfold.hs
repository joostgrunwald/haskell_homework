module Unfold where

import Data.List (unfoldr, (++))
import Data.Char ( Char, intToDigit )
import Prelude hiding (take,zip,(++))

bits :: Int -> [Int]
bits = unfoldr (\x -> if x==0 then Nothing else Just(mod x 2, div x 2))

-- ! normal zip
zip :: [a] -> [b] -> [(a,b)]
zip (a:as) (b:bs) = (a,b) : zip as bs
zip _      _      = []
--[ (x, y) | x <- xs | y <- ys ]

-- take :: Int -> [a] -> [a]

-- ! normal primes
-- might be interesting: https://gist.github.com/jnape/4366618

primes = unfoldr helper
helper :: [Integer]
helper = sieve [2..] where
           sieve (p:xs) = p : sieve [ n | n <- xs, n `mod` p > 0 ]

apo :: (t -> Either [a] (a, t)) -> t -> [a]
apo f seed = case f seed of
               Left l       -> l
               Right (a,ns) -> a : apo f ns

-- (++) :: [a] -> [a] -> [a]
-- insert :: (Ord a) => a -> [a] -> [a]
-- unfoldrApo :: (t -> Maybe (a, t)) -> t -> [a]
