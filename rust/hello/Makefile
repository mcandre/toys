BIN=bin/hello

all: test

test: $(BIN)
	$(BIN)

$(BIN): hello.rs
	mkdir -p bin/
	rustc -o $(BIN) hello.rs

clean:
	-rm -rf bin/
	-rm -rf *.dSYM
