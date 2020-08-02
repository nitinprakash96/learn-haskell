module ListsAgain where


{-
 - Problem 21: Insert an element at a given position into a list.
 -}
insertAt :: a -> [a] -> Int -> [a]
insertAt x xs idx = first ++ x : second
  where (first, second) = splitAt (idx - 1) xs


{-
 - Problem 22: Create a list containing all integers within a given range.
 -}
range' :: Int -> Int -> [Int]
range' start stop = [start..stop]


-- Implementation of the above function with step
-- Not sure if step can be made optional
rangeWithStep :: Int -> Int -> Int -> [Int]
rangeWithStep start stop step = [start, start + step .. finalStop]
  where finalStop = if (stop - start) `mod` step == 0
                    then stop - start
                    else stop


{-
 - Problem 23: Extract a given number of randomly selected elements from a list.
 -}

