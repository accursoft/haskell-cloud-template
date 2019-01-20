import Network.Wai
import Network.HTTP.Types
import Network.Wai.Handler.Warp
import Paths_server

main = do
  response <- getDataFileName "response"
  run 8080 $ \_ respond -> respond $ responseFile
    status200
    [(hContentType, "text/plain")]
    response
    Nothing