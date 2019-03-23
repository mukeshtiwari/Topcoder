import System.Environment (getArgs)
import System.IO
import qualified TopCoder as TC
import qualified SwappingNodes (swapNodes)

getVars :: TC.Parser ([Int], Int)
getVars = do leaves <- TC.spaces >> (TC.parseList TC.parseInt) ; TC.spaces >> TC.next
             numberOfLeaves <- TC.spaces >> TC.parseInt
             return (leaves, numberOfLeaves)

main = do
    args <- getArgs
    hIn <- openFile (head args) ReadMode
    contents <- hGetContents hIn
    case (TC.parse getVars "parse variables" contents) of
        Left err -> print err
        Right (leaves, numberOfLeaves) -> do
            hOut <- openFile (head (tail args)) WriteMode
            hPutStr hOut $ show $ SwappingNodes.swapNodes leaves numberOfLeaves
            hClose hOut
    hClose hIn
