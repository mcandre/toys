BIN=bin/fizzy

all: test

test: $(BIN)
	$(BIN)

$(BIN): fizzy.rs
	mkdir -p bin/
	rustc -o $(BIN) fizzy.rs

clean:
	-rm -rf bin/
	-rm -rf *.dSYM
