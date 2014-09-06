fun fizzy i =
	if i mod 15 = 0 then
		"FizzBuzz"
	else if i mod 3 = 0 then
		"Fizz"
	else if i mod 5 = 0 then
		"Buzz"
	else
		Int.toString i

(*
From Hyperpolyglot
http://hyperpolyglot.org/ml
*)
fun range a b =
	if a > b then []
	else a :: range (a+1) b;

List.map (fn i => print(fizzy i ^ "\n")) (range 1 100);
OS.Process.exit(OS.Process.success);
