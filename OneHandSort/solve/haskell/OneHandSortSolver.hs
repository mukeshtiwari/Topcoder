import System.Environment (getArgs)
import System.IO
import qualified TopCoder as TC
import qualified OneHandSort (sortShelf)

getVars :: TC.Parser ([Int])
getVars = do target <- TC.spaces >> (TC.parseList TC.parseInt)
             return (target)

main = do
    args <- getArgs
    hIn <- openFile (head args) ReadMode
    contents <- hGetContents hIn
    case (TC.parse getVars "parse variables" contents) of
        Left err -> print err
        Right (target) -> do
            hOut <- openFile (head (tail args)) WriteMode
            hPutStr hOut $ show $ OneHandSort.sortShelf target
            hClose hOut
    hClose hIn
