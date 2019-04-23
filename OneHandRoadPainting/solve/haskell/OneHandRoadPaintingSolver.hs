import System.Environment (getArgs)
import System.IO
import qualified TopCoder as TC
import qualified OneHandRoadPainting (fastest)

getVars :: TC.Parser ([Int], [Int], Int)
getVars = do dStart <- TC.spaces >> (TC.parseList TC.parseInt) ; TC.spaces >> TC.next
             dEnd <- TC.spaces >> (TC.parseList TC.parseInt) ; TC.spaces >> TC.next
             paintPerBrush <- TC.spaces >> TC.parseInt
             return (dStart, dEnd, paintPerBrush)

main = do
    args <- getArgs
    hIn <- openFile (head args) ReadMode
    contents <- hGetContents hIn
    case (TC.parse getVars "parse variables" contents) of
        Left err -> print err
        Right (dStart, dEnd, paintPerBrush) -> do
            hOut <- openFile (head (tail args)) WriteMode
            hPutStr hOut $ show $ OneHandRoadPainting.fastest dStart dEnd paintPerBrush
            hClose hOut
    hClose hIn
