There are two ways to pattern-match over a list in Haskell, and there's a subtle difference between them.

Using the `:` constructor:
```haskell
-- Return the first element of a list, taking care of the edge-case where
-- the list may be empty. Which is why the result is a (Maybe a)
firstElem :: [a] -> Maybe a
firstElem xs = case xs of
  [] -> Nothing
  -- Remember to put parantheses around this pattern-match else
  -- the compiler will throw a parse-error
  (x:_) -> Just x
```

```haskell
-- Return the second element of a list
secondElem :: [a] -> Maybe a
secondElem xs = case xs of
  -- Remember the parantheses
  (_:y:_) -> Just y
  (_:[]) -> Nothing 
  [] -> Nothing
```

```haskell
Using the `[]` constructor:
-- Return the first element of a list
firstElem :: [a] -> Maybe a
firstElem xs = case xs of
  -- Remember to put parantheses around this pattern-match else
  -- the compiler will throw a parse-error
  (x:_) -> Just x
  [] -> Nothing
```
