module SwappingNodes where

solveRecursive :: [Int] -> Int -> [Int]
solveRecursive []  _ = []
solveRecursive [x] _ = [x]
solveRecursive xs n = ret where
  n' = div n 2
  (xs', ys') = splitAt n' xs
  u@(x : xs'') = solveRecursive xs' n'
  v@(y : ys'') = solveRecursive ys' n'
  ret = if x < y then u ++ v else v ++ u

swapNodes :: [Int] -> Int -> [Int]
swapNodes leaves numberOfLeaves = solveRecursive leaves numberOfLeaves 
