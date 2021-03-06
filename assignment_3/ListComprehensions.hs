module ListComprehensions where

import Data.List

makeEveryCombination as bs = [ (a,b) | a <- as, b <- bs ] -- make a combination of every possible letter that's possible (type string string)

makeCopy n y   = [ y | i <- [1..n] ] -- makes a copy of a number the amount of times you ask for it. (type string string)

getLettersOfString n xs  = [ x | (i,x) <- zip [0..] xs, i < n ] --gives back the number of first letters that you request back (type number number)

givePositionBackOffChar a xs  = [ i | (i,x) <- zip [0..] xs, x == a] --gives index position of every char in string (type char string)

combineStringsOnOldPosition xs ys = [ e | (x,y) <- zip xs ys, e <- [x,y] ] --combines the letters of b oth strings together, every time the first position gets added then the second position etc.
-- If one string is longer then a other string the string with the least characters will be the max on where it will go. (type string string)

listToString xss   = [ x | xs <- xss, x <- xs ] --asks for a list with a string and returns a string (type list)

--not a single class is polymorphic, no function can accept multiple inputs of a different type. 
