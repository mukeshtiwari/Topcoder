import TopCoder
import System.Environment (getArgs)
import System.IO
import NumbersChallenge

getVars :: Parser ([Int])
getVars = do s <- spaces >> (parseList parseInt)
             return (s) 

main = do 
    args <- getArgs
    hIn <- openFile (head args) ReadMode
    contents <- hGetContents hIn
    case (parse getVars "variables" contents) of
        Left err -> print err
        Right (s) -> do
            hOut <- openFile (head (tail args)) WriteMode
            hPutStr hOut $ show $ minNumber s
            hClose hOut
    hClose hIn
