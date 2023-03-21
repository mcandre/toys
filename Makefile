.PHONY: all lint test clean

all: lint

funk:
	@funk .

yamllint:
	@yamllint -s .yamllint .

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

lint: funk yamllint checkmake

test:
	@echo "nothing to do"

clean:
	@echo "nothing to do"
