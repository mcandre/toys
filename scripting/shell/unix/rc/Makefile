.PHONY: all lint test clean

all: lint

funk:
	@funk .

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

lint: funk checkmake

test:
	@echo "nothing to do"

clean:
	@echo "nothing to do"
