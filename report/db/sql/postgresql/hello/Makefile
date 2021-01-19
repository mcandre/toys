all: test

test: hello.psql
	psql -f hello.psql

pgsanity:
	find . -type f -name "*.psql" | xargs pgsanity

lint: pgsanity
