#light (*
	exec fsharpi --exec $0 --quiet
*)

let fizzbuzz n =
	if n % 15 = 0 then
		"FizzBuzz"
	else if n % 3 = 0 then
		"Fizz"
	else if n % 5 = 0 then
		"Buzz"
	else
		n.ToString("d")

let main =
	for n in 1 .. 100 do
		printfn "%s" (fizzbuzz n)