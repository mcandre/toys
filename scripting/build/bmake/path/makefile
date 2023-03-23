.PHONY: all lint test clean

all: test

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

lint: checkmake

# Implicitly assumes a UNIX environment.
test:
	@readlink -f .

clean:
	@echo "nothing to do"
