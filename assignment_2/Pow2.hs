module Pow2 where

-- !exercise 2.3.1 and 2.3.2

-- THINKING STAGE
-- 2^0 = 1, 2^1 = 2, 2^2 = 4, 2^3 = 8, 2^4 - 16
-- PATTERN n = 2(n-1)

pow2 :: (Ord n, Num n, Num a) => n -> a
pow2 0 = 1 --base case
pow2 n = 2 * pow2(n-1) --recursive case

-- !exercise 2.3.3
-- 23
-- TODO ADD EXPLANATION