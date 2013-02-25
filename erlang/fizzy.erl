-module(fizzy).
-author("andrew.pennebaker@gmail.com").
-export([fizzbuzz/1, main/1]).

fizzbuzz(N) ->
	X = N rem 3,
	Y = N rem 5,
	case {X,Y} of
		{0,0} -> "FizzBuzz";
		{0,_} -> "Fizz";
		{_,0} -> "Buzz";
		_ -> io_lib:format("~b", [N])
	end.

main(_) -> lists:map(
			 fun(S) -> io:format("~s\n", [S]) end,
			 rpc:pmap({fizzy, fizzbuzz}, [], lists:seq(1, 100))
		   ).
