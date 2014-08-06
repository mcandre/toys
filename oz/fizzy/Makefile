BIN=bin/fizzy

all: test

test: $(BIN)
	$(BIN)

$(BIN): fizzy.oz
	mkdir -p bin/
	ozc -x -o $(BIN) fizzy.oz

clean:
	-rm -rf bin/
