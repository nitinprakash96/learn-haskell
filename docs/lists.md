---

---
# Haskell Lists: 2 big caveats

There are **_two major differences_** in Haskell lists, compared to other languages, especially dynamically typed languages, like Python, Ruby, PHP, and Javascript.

1. First, lists in Haskell are **_homogenous_**. This means that a Haskell list can only hold elements of the **_same type_**
2. Second, lists in Haskell are (internally) implemented as **_linked lists_**. This is different from many other languages, where the word "list" and "array" is used interchangeably. Linked lists and arrays have very different performance characteristics when operating on large amounts of data. Keep this in mind for the future. If you're dealing with very large lists, where you want to randomly access the `i`-th element multiple times, use a `Vector` instead.

Example:

    -- A list of numbers
    let a = [1, 5, 7, 12, 56]
    
    -- A list of booleans
    let b = [True, False, False, True]