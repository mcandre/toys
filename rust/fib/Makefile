FLAGS=-O

BIN=bin/fib

all: test

test: $(BIN)
	$(BIN)

$(BIN): fib.rs
	mkdir -p bin
	rustc -o $(BIN) fib.rs $(FLAGS)

clean:
	-rm -rf bin
	-rm -rf *.dSYM
