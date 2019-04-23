module OneHandScheduling where
import Data.List

matchInterval :: [(Int, Int)] -> String
matchInterval [x] = "possible"
matchInterval ((a, b) : (x, y) : xs) = ret where
  ret
    | b < x = matchInterval ((x, y) : xs)
    | otherwise = "impossible" 

checkSchedule :: [Int] -> [Int] -> String
checkSchedule tStart tEnd = ret where
  izip = sort . zip tStart $ tEnd
  ret = matchInterval izip

