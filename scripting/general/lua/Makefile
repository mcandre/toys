.PHONY: all lint test clean

all: lint

luac:
	mkdir -p bin
	for f in *.lua; do luac -o bin/$$(basename $$f .lua).luac $$f; done

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

lint: luac checkmake

clean:
	-rm -rf bin
