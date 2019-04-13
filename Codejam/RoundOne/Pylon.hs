import qualified Data.List as List
import qualified Data.Maybe as Maybe

isCond :: Int -> Int -> Int -> Int -> Bool
isCond r c x y = not . or $ [r == x, c == y, r - c == x - y, r + c == x + y]

findPossibleMove :: Int -> Int -> [(Int, Int)] -> [(Int, Int)]
findPossibleMove r c xs = filter (\(x, y) -> isCond r c x y) $ xs 

solve :: Int -> Int -> [((Int, Int), [(Int, Int)])]
solve r c = val where
  rcproduct = [(x, y) | x <- [1 .. r], y <- [1 .. c]]
  pmove = map (\(x, y) -> findPossibleMove x y rcproduct) rcproduct
  val = zip rcproduct pmove  


retList :: (Int, Int) -> [((Int, Int), [(Int, Int)])] -> [(Int, Int)]
retList x xs = case filter (\(a, y) -> a == x) xs of
                 [] -> []
                 ((h, t) : _) -> t 

{-
findPath :: [(Int, Int)] -> [((Int, Int), [(Int, Int)])] -> [(Int, Int)] -> [(Int, Int)]
findPath [] _ _ = []
findPath (x : xs) ys vis = ret where
  ret = if List.elem x vis then findPath xs ys vis 
        else x : findPath (xs ++ retList x ys ) ys (x : vis) -}

findPath :: [(Int, Int)] -> [((Int, Int), [(Int, Int)])] -> [(Int, Int)] -> [(Int, Int)]
findPath [] _ _ = []
findPath (x : xs) ys vis = ret where
  ret = if List.elem x vis then findPath xs ys vis
        else x : findPath (retList x ys ++ xs) ys (x : vis)


tryAllPossibility :: Int -> Int -> [[(Int, Int)]]
tryAllPossibility r c = ret where 
  rcproduct = [(x, y) | x <- [1 .. r], y <- [1 .. c]]
  path = solve r c
  ret = map (\(x, y) -> findPath [(x, y)] path []) rcproduct

processList :: [(Int, Int)] -> String
processList [] = ""
processList [(a, b)] = show a ++ " " ++ show b
processList ((a, b) : xs) = show a ++ " " ++ show b ++ "\n" ++ processList xs

finalSolve :: [Int] -> String
finalSolve [r, c] = ret where 
  ans = filter (\x -> List.length x == r * c) (tryAllPossibility r c)
  ret = if List.null ans then "IMPOSSIBLE" else "POSSIBLE" ++ "\n" ++ (processList . List.head $ ans)

rInt :: String -> Int
rInt = read

main :: IO ()
main = interact $ unlines.zipWith (++) ["Case #" ++ (show i) ++ ": " | i <- [1..]] .
         map finalSolve . (map . map) rInt . map words . tail . lines


