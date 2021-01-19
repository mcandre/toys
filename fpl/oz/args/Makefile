BIN=bin/args

all: test

test: $(BIN)
	$(BIN) a b c

$(BIN): args.oz
	mkdir -p bin/
	ozc -x -o $(BIN) args.oz

clean:
	-rm -rf bin/
