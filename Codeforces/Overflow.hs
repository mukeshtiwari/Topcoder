import qualified Data.List as List

data Command = For Integer | Add | End
            deriving (Eq, Show)

data Instr =
    One Command
  | More [Instr]
  deriving (Eq, Show)


{- reduce the stack -}
turnOutermost :: [Instr] -> [Instr] -> [Instr]
turnOutermost [] acc = acc
turnOutermost (One End : rest) acc = turnOutermost rest (One End : acc)
turnOutermost (One Add : rest) acc  = turnOutermost rest (One Add : acc)
turnOutermost (More x : rest) acc = turnOutermost rest (More x : acc)
turnOutermost (One (For n) : rest) acc = More (One (For n) : acc) : rest


{- Shift and reduce -}
parseCommand :: [Command] -> [Instr] -> [Instr]
parseCommand [] stack = stack
parseCommand (Add : rest) stack
  | stack == [] =  One Add : parseCommand rest stack
  | otherwise = parseCommand rest (One Add : stack)
parseCommand(For n : rest) stack = parseCommand rest (One (For n) : stack)
parseCommand (End : rest) stack = ret where
    tw = turnOutermost (One End : stack) []
    ret = case tw of 
           [x] -> x : parseCommand rest []
           _ -> parseCommand rest tw

evalCommand :: [Instr] -> Integer
evalCommand [] = 0
evalCommand (One Add : xs) = 1 + evalCommand xs
evalCommand (One End : xs) = evalCommand xs
evalCommand (One (For n) : xs) = n * evalCommand xs
evalCommand (More t : xs) = evalCommand t + evalCommand xs




solve :: [Command] -> String
solve xs = ret where
  rt = evalCommand (parseCommand xs [])
  ret = if rt > 4294967295 then "OVERFLOW!!!" else show rt


strCommand :: [String] -> Command
strCommand ["add"] = Add
strCommand ["end"] = End
strCommand ["for", n] = For (read n :: Integer)


main :: IO ()
main = interact $  solve . map (strCommand . words) . tail . lines








