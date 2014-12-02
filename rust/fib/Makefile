FLAGS=-O -W missing-doc -W non-uppercase-statics -W unnecessary-qualification -W unnecessary-typecast -W unused-result

BIN=bin/fib

all: test

test: $(BIN)
	$(BIN)

$(BIN): fib.rs
	mkdir -p bin/
	rustc -o $(BIN) fib.rs $(FLAGS)

clean:
	-rm -rf bin/
	-rm -rf *.dSYM
