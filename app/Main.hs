module Main where
import Utils (getContent)
import Day01 (executeDay01)

main :: IO ()
main = do 
  day01Resource <- getContent "resources/day01.txt"
  let day01Content = map words day01Resource
  let day01Results = executeDay01 day01Content

  putStrLn $ "-- Day 1: " ++ show day01Results
  


