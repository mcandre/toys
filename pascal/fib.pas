program Fib;
var
	n : integer;

	function Fib (n : integer) : integer;
	begin
		case n of
			1: Fib := 1;
			2: Fib := 1;
			otherwise Fib := Fib (n - 2) + Fib (n - 1)
		end;
	end;

begin
	write('n = ');
	readln(n);

	write('Fib n = ');
	writeln(Fib(n))
end.
