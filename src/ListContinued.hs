module ListContinued where

import Data.List (group)


{-
 - Problem 11: Modified run-length encoding.
 - Modify the result of problem 10 in such a way that if an element has no
 - duplicates it is simply copied into the result list. Only elements with
 - duplicates are transferred as (N E) lists.
 -}
data ListElem a = Single a | Multiple Int a deriving (Show, Eq)
encodedModified :: Eq a => [a] -> [ListElem a]
encodedModified xs = [y | x <- group xs,
                      let y = if (length xs) == 1 then Single (head x)
                            else Multiple (length x) (head x)]


{-
 - Problem 12: Decode a run-length encoded list.
 - Given a run-length code list generated as specified in problem 11.
 - Construct its uncompressed version.
 -}
-- We can use the defined data type in the above function
-- But can we use foldl here to solve this problem?
decode :: [ListElem a] -> [a]
decode = concatMap decodeUtil
  where decodeUtil (Single x) = [x]
        decodeUtil (Multiple c x) = replicate c x


{-
 - Run-length encoding of a list (direct solution).
 -Implement the so-called run-length encoding data compression method directly.
 - I.e. don't explicitly create the sublists containing the duplicates, as in
 - problem 9, but only count them.

 - As in problem P11, simplify the result list by replacing the singleton lists (1 X) by X.

 - I don't really understand this problem.
 - TODO: Try to understand the problem from the solutions provided
-}


{-
 - Problem 14: Duplicate the elements of a list. 
 -}
dupli :: [a] -> [a]
dupli = concatMap (\x -> [x, x])


{-
 - Problem 15: Replicate the elements of a list a given number of times.
 -}
repli :: [a] -> Int -> [a]
repli xs k = concatMap (replicate k) xs


{-
 - Problem 16: Drop every N'th element from a list.
 -}
dropEveryNth :: [a] -> Int -> [a]
dropEveryNth xs k = [i | (i, c) <- (zip xs [1, 2..]), (mod c k) /= 0]


{-
 - Problem 17: Split a list into two parts; the length of the first part is given.

 - Do not use any predefined predicates.

 - Without above constraint, it could've been as easy as
 - split xs k = (take k xs, drop k xs)
 -}
 -- splitList :: [a] -> Int -> ([a], [a])


{-
 - Problem 18: Extract a slice from a list.

 - Given two indices, i and k, the slice is the list containing the
 - elements between the i'th and k'th element of the original list
 - (both limits included). Start counting the elements with 1.
 -}
-- I just happen to like List comprehensions a lot
slice :: [a] -> Int -> Int -> [a]
slice xs i k = [x | (x, j) <- zip xs [1..k], i <= j]


{-
 - Problem 19: Rotate a list N places to the left.

 - Hint: Use the predefined functions length and (++).
 -}
rotate :: [a] -> Int -> [a]
rotate xs k = take len . drop (k `mod` len) . cycle $ xs
  where len = length xs


{-
 - Problem 20: Remove the K'th element from a list.
 -}
removeKth :: [a] -> Int -> (a, [a])
removeKth [] _ = error "List is empty Jackass!"
removeKth xs k = (xs !! (k - 1), take (k - 1) xs ++ drop k xs)
