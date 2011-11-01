#!/usr/bin/env MathKernel -script

Fizzy[n_Integer] := Piecewise[
	{
		{"FizzBuzz", Divisible[n, 3] && Divisible[n, 5]},
		{"Fizz", Divisible[n, 3]},
		{"Buzz", Divisible[n, 5]}
	},
	ToString[n]
]

Map[Composition[Print, Fizzy], Range[1, 100]]