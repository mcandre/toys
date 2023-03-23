.PHONY: all lint test clean

FLAGS=-w -wi

BIN=bin/hello

all: test

test: $(BIN)
	@$(BIN)

$(BIN): hello.d
	@mkdir -p bin
	@dmd $(FLAGS) -of$(BIN) hello

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
	-rm *.o
