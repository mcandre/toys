.PHONY: all lint test clean

FLAGS=-O2

all: lint

csc:
	mkdir -p bin
	for f in *.scm; do csc $(FLAGS) -o bin/$$(basename $$f .scm) $$f; done

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

lint: csc checkmake

test:
	@echo "nothing to do"

clean:
	-rm -rf bin
