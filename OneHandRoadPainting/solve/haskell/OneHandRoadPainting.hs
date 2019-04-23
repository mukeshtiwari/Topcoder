module OneHandRoadPainting where
import qualified Data.List as List

sliceSegment :: [(Integer, Integer)] ->  Integer -> [(Integer, Integer)]
sliceSegment []  _ = []
sliceSegment t@((endSeg, begSeg) : xs) paintPerBrush
  | paintPerBrush >= (endSeg - begSeg) = sliceSegment xs (paintPerBrush - (endSeg - begSeg))
  | paintPerBrush < (endSeg - begSeg) = ((endSeg - paintPerBrush), begSeg) : xs
  

sumAP :: Integer -> Integer -> Integer -> Integer
sumAP a n d = div (n * (2 * a + (n - 1) * d)) 2

solve :: [(Integer, Integer)] -> Integer -> Integer
solve [] _ = 0
solve t@((endSeg, begSeg) : xs) paintPerBrush = ret where
  (numseg, restseg) = quotRem (endSeg - begSeg) paintPerBrush
  ret = solveSimulator numseg restseg paintPerBrush t 

solveSimulator :: Integer -> Integer -> Integer -> [(Integer, Integer)] -> Integer
solveSimulator numseg restseg paintPerBrush t@((endSeg, begSeg) : xs) 
  | and [numseg == 0, restseg == 0] = error "End and beginning are same and should not happen"
  | and [numseg /= 0, restseg == 0] = 2 * sumAP endSeg numseg (-paintPerBrush) + solve xs paintPerBrush
  | and [numseg == 0, restseg /= 0] = let rest = sliceSegment t paintPerBrush in 2 * endSeg + solve rest paintPerBrush
  | otherwise = 2 * sumAP endSeg numseg (-paintPerBrush) +   
          let rest = sliceSegment (((endSeg - numseg * paintPerBrush), begSeg) : xs) paintPerBrush in 2 * (endSeg - numseg * paintPerBrush) + solve rest paintPerBrush

fastest :: [Int] -> [Int] -> Int -> Integer
fastest dStart dEnd paintPerBrush = ret where
  zipseg = reverse . zip  (map toInteger dEnd) $ (map toInteger dStart)
  ret = solve zipseg (toInteger paintPerBrush)

