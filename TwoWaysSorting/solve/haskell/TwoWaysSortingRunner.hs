import TopCoder
import System.Environment (getArgs)
import System.IO
import TwoWaysSorting

getVars :: Parser ([String])
getVars = do stringList <- spaces >> (parseList parseString)
             return (stringList) 

main = do 
    args <- getArgs
    hIn <- openFile (head args) ReadMode
    contents <- hGetContents hIn
    case (parse getVars "variables" contents) of
        Left err -> print err
        Right (stringList) -> do
            hOut <- openFile (head (tail args)) WriteMode
            hPutStr hOut $ show $ sortingMethod stringList
            hClose hOut
    hClose hIn
