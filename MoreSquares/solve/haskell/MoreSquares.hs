module MoreSquares where
import qualified Data.List as List
import qualified Data.Set as Set

type Point = (Int, Int)

addTuple :: Point -> Point  -> Point
addTuple (a, b) (c, d) = (a + c, b + d)


genPoint :: Point -> Point -> [Point]
genPoint (a, b) (c, d) = [u, v] where
  p = (-(d - b), c - a)
  u = addTuple (a, b) p
  v = addTuple (c, d) p


countPoint :: [(Point, Point)] -> Set.Set Point -> Set.Set Point -> Int
countPoint [] sfull s =  Set.size s
countPoint ((a, b) : xs) sfull s = ret where
   [fpoint, spoint] = genPoint a b
   ret = case (Set.member fpoint sfull, Set.member spoint sfull) of
           (True, True) -> countPoint xs sfull s
           (True, False) -> countPoint xs sfull (Set.insert spoint s)
           (False, True) -> countPoint xs sfull (Set.insert fpoint s)
           (False, False) -> countPoint xs sfull s
    
countLocations :: Int -> Int -> Int -> [Int] -> [Int] -> Int
countLocations n sX sY xprefix yprefix = ret where 
  xlast = List.last xprefix
  ylast = List.last yprefix
  x = List.take n (xprefix ++ (List.tail . iterate (\x -> mod (x * 47 + 42) sX) $ xlast))
  y = List.take n (yprefix ++ (List.tail . iterate (\x -> mod (x * 47 + 42) sY) $ ylast))
  s = Set.fromList (zip x y)
  ppoint = Set.toList s
  zippoint = [(p, q) | p <- ppoint, q <- ppoint, p /= q]
  ret = countPoint zippoint s Set.empty
  
