# About

Scientific experiment to evaluate how Haskell uses memoization to increase program efficiency.

[Source](https://groups.google.com/d/msg/haskell-cafe/4xOSfavJztU/ozKIGRDqe9UJ)

# Example

```
$ make
time ./fib1.hs
832040
       12.11 real        1.92 user         0.21 sys
$ time ./fib2.hs
832040
       2.56 real         1.94 user         0.06 sys
```
