


mirrorPath :: String -> String
mirrorPath []  = []
mirrorPath ('S' : xs) = 'E' : mirrorPath xs
mirrorPath ('E' : xs) = 'S' : mirrorPath xs

removeInt :: [String] -> [String]
removeInt [] = []
removeInt (x : y : xs) = y : removeInt xs

main :: IO ()
main = interact $ unlines.zipWith (++) ["Case #" ++ (show i) ++ ": " | i <- [1..]] . 
   map mirrorPath . removeInt .  tail . lines
