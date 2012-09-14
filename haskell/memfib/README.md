# About

Scientific experiment to evaluate how Haskell uses memoization to increase progr
am efficiency.

[Source](https://groups.google.com/d/msg/haskell-cafe/4xOSfavJztU/ozKIGRDqe9UJ)

# Example

	$ time ./fib1.hs 
	832040

	real	0m1.990s
	user	0m1.912s
	sys		0m0.058s

	$ time ./fib2.hs 
	832040
	832040
	832040

	real	0m2.011s
	user	0m1.928s
	sys		0m0.063s
