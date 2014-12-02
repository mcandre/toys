FLAGS=-O -W missing-doc -W non-uppercase-statics -W unnecessary-qualification -W unnecessary-typecast -W unused-result

BIN=bin/hello

all: test

test: $(BIN)
	$(BIN)

$(BIN): hello.rs
	mkdir -p bin/
	rustc -o $(BIN) hello.rs $(FLAGS)

clean:
	-rm -rf bin/
	-rm -rf *.dSYM
