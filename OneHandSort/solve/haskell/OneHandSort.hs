module OneHandSort where
import qualified Data.List as List

findIndex :: Int -> [(Int, Int)] -> (Int, Int)
findIndex x xs = List.head . filter (\(a, b) -> b == x) $ xs
  
solve :: Int -> [(Int, Int)] -> [Int]
solve _ [] = []
solve n ((x, y) : xs) 
  | x == y = solve n xs
  | otherwise = x : a : n : solve n (rest ++ [(a, y)])  where
      (a, b) = findIndex x xs
      rest = List.delete (a, b) xs

sortShelf :: [Int] -> [Int]
sortShelf target = ret where
  n = length target
  izip = zip [0..n] target
  ret = solve n izip 
