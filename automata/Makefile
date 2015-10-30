BIN=bin/automata

default: test

test: $(BIN)
	$(BIN)

$(BIN): automata.c
	mkdir -p bin/
	gcc -O2 -Wall -o $(BIN) automata.c

clean:
	-rm $(BIN)
