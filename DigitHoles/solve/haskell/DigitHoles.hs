module DigitHoles where 

numHoles :: Int -> Int
numHoles number = solve ( show number ) 0 where
  solve :: String -> Int -> Int
  solve [] cnt = cnt
  solve ( x : xs ) cnt
   | elem x "12357" = solve xs cnt
   | elem x "0469"  = solve xs ( cnt + 1 ) 
   | otherwise      = solve xs ( cnt + 2 )
