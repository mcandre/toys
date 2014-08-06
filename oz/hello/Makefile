BIN=bin/hello

all: test

test: $(BIN)
	$(BIN)

$(BIN): hello.oz
	mkdir -p bin/
	ozc -x -o $(BIN) hello.oz

clean:
	-rm -rf bin/
