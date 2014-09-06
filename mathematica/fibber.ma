#!/usr/bin/env MathKernel -script

Fibber[n_Integer] := Piecewise[
	{
		{0, n == 0},
		{1, n == 1}
	},
	Fibber[n - 1] + Fibber[n - 2]
]

Print[Fibber[20]]
