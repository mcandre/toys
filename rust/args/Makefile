BIN=bin/args

all: test

test: $(BIN)
	$(BIN) a b c

$(BIN): args.rs
	mkdir -p bin/
	rustc -o $(BIN) args.rs

clean:
	-rm -rf bin/
	-rm -rf *.dSYM
