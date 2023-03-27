.PHONY: all lint test clean

BIN=bin/hello

all: $(BIN)
	@$(BIN)

$(BIN): hello.ml
	@mkdir -p bin
	@ocamlc -w +a -o $(BIN) hello.ml

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

clean:
	-rm -rf bin
