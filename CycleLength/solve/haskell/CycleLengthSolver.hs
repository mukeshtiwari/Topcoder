import System.Environment (getArgs)
import System.IO
import qualified TopCoder as TC
import qualified CycleLength (solve)

getVars :: TC.Parser (Int, Int, Int, Int)
getVars = do seed <- TC.spaces >> TC.parseInt ; TC.spaces >> TC.next
             a <- TC.spaces >> TC.parseInt ; TC.spaces >> TC.next
             b <- TC.spaces >> TC.parseInt ; TC.spaces >> TC.next
             m <- TC.spaces >> TC.parseInt
             return (seed, a, b, m)

main = do
    args <- getArgs
    hIn <- openFile (head args) ReadMode
    contents <- hGetContents hIn
    case (TC.parse getVars "parse variables" contents) of
        Left err -> print err
        Right (seed, a, b, m) -> do
            hOut <- openFile (head (tail args)) WriteMode
            hPutStr hOut $ show $ CycleLength.solve seed a b m
            hClose hOut
    hClose hIn
