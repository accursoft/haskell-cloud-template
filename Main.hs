import Control.Monad
import Data.Char
import System.IO
import System.IO.Error
import Network
import Paths_server

main = do sock <- listenOn $ PortNumber 8080
          response <- getDataFileName "response" >>= readFile
          forever $ do (handle,_,_) <- accept sock
                       request <- hGetContents handle
                       when (any (null . dropWhile isSpace) (lines request)) $ void $ tryIOError $ hPutStr handle response
                       hClose handle
