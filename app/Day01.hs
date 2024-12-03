{-# LANGUAGE DataKinds #-}
module Day01 (executeDay01) where

import Data.List (sort)

getList :: ([String] -> String) -> [[String]] -> [Int]
getList ht = sort . map (read . ht)

checkOccurrence :: Int -> [Int] -> Int
checkOccurrence n a = length $ filter (== n) a

-- for each ordered pair X and Y in two different lists, find the difference between them and sum 
-- the results
day01Part1 :: [Int] -> [Int] -> Int
day01Part1 listOne listTwo = 
  foldl (\a (x, y) -> a + abs (x - y)) 0 $ zip listOne listTwo

-- for each X in list A, check how many times (N) its present in list B, then
-- multiply X by N and sum each result
day01Part2 :: [Int] -> [Int] -> Int
day01Part2 listOne listTwo =
  foldl (\a x -> a + x * checkOccurrence x listTwo) 0 listOne

executeDay01 :: [[String]] -> (Int, Int)
executeDay01 content = (a, b) where 
  listOne = getList head content
  listTwo = getList last content
  a = day01Part1 listOne listTwo
  b = day01Part2 listOne listTwo
