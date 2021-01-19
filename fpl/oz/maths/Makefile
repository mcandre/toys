BIN=bin/maths

all: test

test: $(BIN)
	$(BIN)

$(BIN): maths.oz
	mkdir -p bin/
	ozc -x -o $(BIN) maths.oz

clean:
	-rm -rf bin/
