module Result where

import Data.List

data Result a = Okay a | Error [String]
  deriving (Eq,Ord,Show)

-- Exercise 11.5.1
instance Functor Result where
  fmap f (Okay x) = Okay (f x)
  fmap f (Error [x]) = Error [x]

-- Exercise 11.5.2
-- fmap :: p -> Result a1 -> Result a2

-- Exercise 11.5.3
instance Applicative Result where
  --pure :: a -> Result a
  pure = Okay
  --(<*>) :: Result a1 -> p -> Result a2
  Error [x] <*> _ = Error [x]
  --(<*>) :: Functor f => Result (a -> b) -> f a -> f b
  (Okay f) <*> something = fmap f something
  



