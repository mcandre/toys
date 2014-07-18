all: test

test: hello.psql
	psql -f hello.psql

pgsanity:
	find . -type f -name '*.psql' -exec pgsanity {} \;

lint: pgsanity
