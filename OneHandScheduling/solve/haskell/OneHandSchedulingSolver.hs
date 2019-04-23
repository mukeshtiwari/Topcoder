import System.Environment (getArgs)
import System.IO
import qualified TopCoder as TC
import qualified OneHandScheduling (checkSchedule)

getVars :: TC.Parser ([Int], [Int])
getVars = do tStart <- TC.spaces >> (TC.parseList TC.parseInt) ; TC.spaces >> TC.next
             tEnd <- TC.spaces >> (TC.parseList TC.parseInt)
             return (tStart, tEnd)

main = do
    args <- getArgs
    hIn <- openFile (head args) ReadMode
    contents <- hGetContents hIn
    case (TC.parse getVars "parse variables" contents) of
        Left err -> print err
        Right (tStart, tEnd) -> do
            hOut <- openFile (head (tail args)) WriteMode
            hPutStr hOut $ show $ OneHandScheduling.checkSchedule tStart tEnd
            hClose hOut
    hClose hIn
