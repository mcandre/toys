all: test

test: 99bottles.psql
	psql -f 99bottles.psql
	psql -c 'SELECT bottles(n) FROM generate_series(99, 1, -1) n;'
