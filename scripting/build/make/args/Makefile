.PHONY: all lint test clean

#
# Run as `make ARGS="<arg arg arg...>"`
#
# Make treats raw arguments as targets, requiring
# manual variable assignment to pass arguments.

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

test:
	@echo ${ARGS}

clean:
	@echo "nothing to do"
