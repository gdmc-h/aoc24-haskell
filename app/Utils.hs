module Utils (getContent) where
getContent :: String -> IO [String]
getContent path = do
  res <- readFile path 
  return $ lines res
