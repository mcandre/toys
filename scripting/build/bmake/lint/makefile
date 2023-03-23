.PHONY: all lint test clean

all: test

# If this makefile contains any syntax errors, make will report them.
# This task is therefore often superfluous.
self-lint:
	@make -n makefile

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

lint: self-lint checkmake

test: lint

clean:
	@echo "nothing to do"
