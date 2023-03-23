.PHONY: all lint test clean

all: test

test: fizzy.psql
	@psql -f fizzy.psql
	@psql -c 'SELECT fizzy(generate_series(1, 100));'

pgsanity:
	@find . \
		-type f \
		-name "*.psql" | \
		xargs pgsanity

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
