.PHONY: all lint test clean

all: test

test: fib.psql
	psql -f fib.psql
	time -p psql -c 'SELECT fib(20);'

pgsanity:
	find . -type f -name "*.psql" | xargs pgsanity

checkmake:
	@find . \
		-type f \
		\( \
			-iname Makefile -o \
			-iname GNUmakefile -o \
			-iname '*.mk' -o \
			-iname '*.make' \
		\) \
		-print0 | \
		xargs -0 -n 1 checkmake

lint: pgsanity checkmake
