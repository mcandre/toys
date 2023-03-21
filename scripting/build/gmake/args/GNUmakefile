.PHONY: all lint test clean

#
# Run as `gmake ARGS="<arg arg arg...>"`
#
# Make treats raw arguments as targets, requiring
# manual variable assignment to pass arguments.

all:
	@echo ${ARGS}

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
	@echo "nothing to do"

clean:
	@echo "nothing to do"
