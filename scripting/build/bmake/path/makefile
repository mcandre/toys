.PHONY: all lint test clean

#
# Help debug environment, identifying
# the PATH as make sees it.
#

all:
	@echo $$PATH

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
