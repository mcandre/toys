all: test

test: 99bottles.psql
	psql -f 99bottles.psql
	psql -c 'SELECT bottles(generate_series(99, 1, -1));'

pgsanity:
	find . -type f -name "*.psql" | xargs pgsanity

lint: pgsanity
