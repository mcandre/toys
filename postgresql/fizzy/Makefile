all: test

test: fizzy.psql
	psql -f fizzy.psql
	psql -c 'SELECT fizzy(generate_series(1, 100));'
