import Data.List


divNum :: Integer -> Integer -> Integer
divNum 0 _ = 0
divNum n k = mod n k + 1 + divNum (div n k) k

solve :: [Integer] -> String
solve [n, k] = show ((divNum n k) - 1)

main = interact $ intercalate "\n" .  map solve .  map (map (\x -> read x :: Integer) .  words) . tail . lines
