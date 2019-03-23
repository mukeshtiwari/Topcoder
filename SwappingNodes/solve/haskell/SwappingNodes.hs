module SwappingNodes where


compareList :: [Int] -> [Int] -> ([Int], [Int])
compareList (x : xs) (y : ys) = 
  case y < x of
   True -> (y : ys, x : xs)
   False -> (x : xs, y : ys)

combineList :: [Int] -> [Int] -> [Int]
combineList  = (++)

solveRecursively :: [Int] -> [Int] -> Int -> [Int]
solveRecursively [] [] _ = []
solveRecursively [x] [] _ = [x]
solveRecursively [] [y] _ = [y]
solveRecursively [x] [y] _ =
  let (first, second) = compareList [x] [y] in 
  combineList first second
solveRecursively xs ys n = 
  let (xs', ys') = splitAt (div n 2) xs in 
  let (xs'', ys'') = splitAt (div n 2) ys in 
  let fh = solveRecursively xs' ys' (div n 2) in
  let sh = solveRecursively xs'' ys'' (div n 2) in 
  let (first, second) = compareList fh sh in 
  combineList first second      


swapNodes :: [Int] -> Int -> [Int]
swapNodes leaves numberOfLeaves =
  let (first, second) = splitAt (div numberOfLeaves 2) leaves in
  solveRecursively first second (div numberOfLeaves 2)
