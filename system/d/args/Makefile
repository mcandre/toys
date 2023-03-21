.PHONY: all lint test clean

FLAGS=-w -wi

BIN=bin/args

all: test

test: $(BIN)
	$(BIN) a b c

$(BIN): args.d
	mkdir -p bin
	dmd $(FLAGS) -of$(BIN) args

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
