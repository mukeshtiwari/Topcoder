module CycleLength where
import qualified Data.IntMap as IntMap

{- The solution of this problem requires O(m) memory. The next challenge is finding it in constant memory -}
recurseSolve :: Int -> Int -> Int -> Int -> IntMap.IntMap (Int, Int) -> Int -> Int
recurseSolve a b m seed mp cnt =  ret where 
  nextel = mod (a * seed + b) m
  ret  = case IntMap.lookup seed mp of 
           Just (v, c) -> cnt - c
           Nothing -> recurseSolve a b m nextel (IntMap.insert seed (nextel, cnt) mp) (cnt + 1)  

solve :: Int -> Int -> Int -> Int -> Int
solve seed a b m = recurseSolve a b m nextel mp (cnt + 1) where
  cnt = 0
  nextel = mod (a * seed + b) m
  mp = IntMap.fromList [(seed, (nextel, cnt))]
  

