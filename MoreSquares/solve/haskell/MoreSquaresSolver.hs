import System.Environment (getArgs)
import System.IO
import qualified TopCoder as TC
import qualified MoreSquares (countLocations)

getVars :: TC.Parser (Int, Int, Int, [Int], [Int])
getVars = do n <- TC.spaces >> TC.parseInt ; TC.spaces >> TC.next
             sX <- TC.spaces >> TC.parseInt ; TC.spaces >> TC.next
             sY <- TC.spaces >> TC.parseInt ; TC.spaces >> TC.next
             xprefix <- TC.spaces >> (TC.parseList TC.parseInt) ; TC.spaces >> TC.next
             yprefix <- TC.spaces >> (TC.parseList TC.parseInt)
             return (n, sX, sY, xprefix, yprefix)

main = do
    args <- getArgs
    hIn <- openFile (head args) ReadMode
    contents <- hGetContents hIn
    case (TC.parse getVars "parse variables" contents) of
        Left err -> print err
        Right (n, sX, sY, xprefix, yprefix) -> do
            hOut <- openFile (head (tail args)) WriteMode
            hPutStr hOut $ show $ MoreSquares.countLocations n sX sY xprefix yprefix
            hClose hOut
    hClose hIn
