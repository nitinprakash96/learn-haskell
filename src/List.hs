import Data.List (group)

{-
 - Problem 1: Find the last element of a list.
 -}

lastElement :: [a] -> a
lastElement [] = error "List is empty Jackass!"
lastElement [x] = x
lastElement (x : xs) = lastElement xs


{-
 - Problem 2: Find the last but one element of a list
 -}
lastButOneElement :: [a] -> a
lastButOneElement [] = error "List is empty Jackass"
lastButOneElement [x] = error "List has only one element"
lastButOneElement [x, _] = x
lastButOneElement (_ : xs) = lastButOneElement xs


{-
 - Problem 3: Find the K'th element of a list. The first element in the list is number 1.
 -}
kthElement :: [a] -> Int -> a
kthElement [] k = error "List is empty Jackass"
kthElement xs k = xs !! (k - 1)


{-
 - Problem 4: Find the number of elements of a list.
 -}
numOfElements :: [a] -> Int
numOfElements [] = error "List is empty Jackass"
numOfElements xs = sum [1 | _ <- xs]


{-
 - Problem 5: Reverse a list.
 -}
reverseList :: [a] -> [a]
reverseList [] = []
reverseList (x : xs) = reverseList xs ++ [x]


{-
 - Problem 6: Find out whether a list is a palindrome.
 - A palindrome can be read forward or backward; e.g. (x a m a x).
 -}
isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome [_] = True
isPalindrome xs = xs == (reverse xs)


{-
 - Problem 7: Flatten a nested list structure.
 -}
data NestedList a = Elem a | List [NestedList a] deriving (Show, Eq)
flattenList :: NestedList a -> [a]
flattenList (Elem x) = [x]
flattenList (List x) = concatMap flattenList x


{-
 - Problem 8: Eliminate consecutive duplicates of list elements.
 -}
compress :: Eq a => [a] -> [a]
compress = map head . group


{-
- Problem 9: Pack consecutive duplicates of list elements into sublists.
- If a list contains repeated elements they should be placed in separate sublists.
-}
pack :: Eq a => [a] -> [[a]]
pack xs = group xs


{-
 - Run-length encoding of a list. Use the result of problem P09 to implement the so-called
 - run-length encoding data compression method. Consecutive duplicates of elements
 - are encoded as lists (N E) where N is the number of duplicates of the element E.
 -}
encode :: Eq a => [a] -> [(Int, a)]
encode xs = map (\x -> (length x, head x)) $ pack xs
