module Day02 (executeDay02)
where

data Direction =  Asc | Desc | Ignore
  deriving (Show, Eq)

removeNFromList :: Int -> [Int] -> [Int]
removeNFromList _ [] = []
removeNFromList n lst
  | n < 0 || n > length lst = lst
  | otherwise = take n lst ++ drop (n + 1) lst

isSafe :: [Int] -> Bool
isSafe n = 
  (isAllAsc || isAllDesc) && isWithinBounds
  where 
    source = zip n (tail n)
    isAllAsc = all (uncurry (>=)) source
    isAllDesc = all (uncurry (<=)) source
    isWithinBounds =  all (\(x, y) -> abs (x-y) >= 1 && abs (x - y) <= 3) source

problemDampener :: Int -> [Int] -> Bool
problemDampener idx lst
  | idx == length lst = isSafe current
  | not (isSafe current) = problemDampener (idx + 1) lst
  | otherwise = True
  where
    current = removeNFromList idx lst

day02Part1 :: [String] -> Int
day02Part1 =  length . filter id . map (isSafe . map read . words)

day02Part2 :: [String] -> Int
day02Part2 = length . filter id . map (problemDampener 0 . map read . words)


executeDay02 :: [String] -> (Int, Int)
executeDay02 content = 
  (solution1, solution2)
  where 
    solution1 = day02Part1 content
    solution2 = day02Part2 content

