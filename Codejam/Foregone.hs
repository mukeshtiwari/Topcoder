import Data.List

solveProb :: [Integer] -> ([Integer], [Integer]) -> ([Integer], [Integer])
solveProb [] (r1, r2) = (reverse r1, reverse r2)
solveProb (x : xs) (r1, r2)
  | x == 4 = solveProb xs ((x - 1) : r1, 1 : r2)
  | otherwise = solveProb xs (x : r1, 0 : r2)



returnIntList :: Integer -> [Integer]
returnIntList n 
  | n < 10 = [n]
  | otherwise = mod n 10 : returnIntList (div n 10)

convertListInt :: [Integer] -> Integer
convertListInt [x] = x
convertListInt (x : xs) = 10 * convertListInt xs + x


finalSolve :: Integer -> String
finalSolve n = show r1 ++ " " ++ show r2 where
  nlist = returnIntList n
  (rt1, rt2) = solveProb nlist ([], [])
  (r1, r2) = (convertListInt rt1, convertListInt rt2)


rInt :: String -> Integer
rInt = read

main :: IO ()
main = interact $ unlines.zipWith (++) ["Case #" ++ (show i) ++ ": " | i <- [1..]] . map (finalSolve . rInt) . tail . lines
