all: test

test: fib.psql
	psql -f fib.psql
	time -p psql -c 'SELECT fib(20);'
