.PHONY: all lint test clean

all: test

test: 99bottles.psql
	psql -f 99bottles.psql
	psql -c 'SELECT bottles(generate_series(99, 1, -1));'

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

clean:
	@echo "nothing to do"
