all: test

test: rainbow.psql data.psql test.psql
	psql -f rainbow.psql
	psql -f data.psql
	psql -f test.psql

pgsanity:
	find . -type f -name '*.psql' -exec pgsanity {} \;

lint: pgsanity
