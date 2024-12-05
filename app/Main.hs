module Main where
import Utils (getContent)
import Day01 (executeDay01)
import Day02 (executeDay02)

main :: IO ()
main = do 
  day01Resource <- getContent "resources/day01.txt"
  let day01Content = map words day01Resource
  let day01Results = executeDay01 day01Content

  putStrLn $ "-- Day 1: " ++ show day01Results

  day02Content <- getContent "resources/day02.txt"
  let day02Results = executeDay02 day02Content  

  putStrLn $ "-- Day 2: " ++ show day02Results


