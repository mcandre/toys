all: test

test: fib.psql
	psql -f fib.psql
	time -p psql -c 'SELECT fib(20);'

pgsanity:
	find . -type f -name "*.psql" | xargs pgsanity

lint: pgsanity
