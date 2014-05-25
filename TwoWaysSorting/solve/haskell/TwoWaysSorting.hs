{-# LANGUAGE RankNTypes, ScopedTypeVariables  #-}
module TwoWaysSorting where 
import Data.List

lengthSorted :: [ String ] ->  Bool
lengthSorted stringList = sortBy lengthOrder stringList == stringList  where
  lengthOrder xs ys 
     | m < n  = LT
     | m == n = EQ
     | m > n  = GT where
     m = length xs
     n = length ys

lexicoSorted :: [ String ] -> Bool
lexicoSorted stringList = sort stringList == stringList 

sortingMethod :: [String] -> String
sortingMethod stringList
  | lexicoSorted stringList && lengthSorted stringList
      = "both"
  | lexicoSorted stringList
      = "lexicographically"
  | lengthSorted stringList
      = "lengths"
  | otherwise 
      = "none" 
