import TopCoder
import System.Environment (getArgs)
import System.IO
import DigitHoles

getVars :: Parser (Int)
getVars = do number <- spaces >> parseInt
             return (number) 

main = do 
    args <- getArgs
    hIn <- openFile (head args) ReadMode
    contents <- hGetContents hIn
    case (parse getVars "variables" contents) of
        Left err -> print err
        Right (number) -> do
            hOut <- openFile (head (tail args)) WriteMode
            hPutStr hOut $ show $ numHoles number
            hClose hOut
    hClose hIn
