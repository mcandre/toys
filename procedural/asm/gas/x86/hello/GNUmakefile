.PHONY: all lint test clean

# Linux defaults
BIN=bin/hello
OBJ=hello.o

all: test

test: $(BIN)
	@$(BIN)

$(BIN): $(OBJ)
	@mkdir -p bin
	@ld -o $(BIN) $(OBJ)

$(OBJ): hello.s
	@as -o $(OBJ) hello.s

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
	-rm $(OBJ)
