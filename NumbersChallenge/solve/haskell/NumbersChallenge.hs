module NumbersChallenge where 
import Data.List
import Control.Monad

powerSet :: [ Int ] -> [ Int ]
powerSet  = tail . nub .  map sum . filterM ( const [ True, False ] )

minNumber :: [Int] -> Int
minNumber s = solve ( sort s ) 1 where
   solve :: [ Int ] -> Int  -> Int
   solve [] cnt = cnt
   solve ( x : xs ) cnt 
    | x > cnt   = cnt
    | otherwise = solve xs  ( cnt + x )
