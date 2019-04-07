import Data.List
import qualified Data.Set as Set

mkUniq :: Ord a => [a] -> [a]
mkUniq = Set.toList . Set.fromList

callRest :: Integer ->  [Integer] -> [Integer]
callRest prime [] = [prime]
callRest prime (x : xs) = prime : callRest (div x prime) xs


recoverPrime :: [Integer] -> [Integer] -> [Integer]
recoverPrime (x : y : xs) acc
  | x == y = recoverPrime (y : xs) (x : acc)
  | otherwise =  ret ++ callRest sprime (y : xs) where
  sprime = gcd x y
  fprime = div x sprime
  ret = reverse . callRest fprime $ acc


findElement :: Integer -> [(Integer, Char)] -> Char
findElement x [] = error "Fuck me"
findElement x ((a, b) : xs) 
  | x == a = b
  | otherwise = findElement x xs
 

recoverMessage :: [Integer] -> [(Integer, Char)] -> String
recoverMessage [] _ = []
recoverMessage (x : xs) ys = findElement x ys : recoverMessage xs ys

constructMessage ::  [Integer] -> String
constructMessage xs = ret where
  r = recoverPrime xs []
  w = zip (sort . mkUniq  $ r) ['A', 'B' .. 'Z']
  ret = recoverMessage r w

rInt :: String -> Integer
rInt = read

processInput :: [String] -> [[Integer]]
processInput [] = []
processInput (x : y : xs) =  map rInt (words y) : processInput xs

main :: IO ()
main = interact $ unlines.zipWith (++) ["Case #" ++ (show i) ++ ": " | i <- [1..]] . 
   map constructMessage . processInput . tail . lines
