FLAGS=-O -W missing-doc -W non-uppercase-statics -W unnecessary-qualification -W unnecessary-typecast -W unused-result

BIN=bin/args

all: test

test: $(BIN)
	$(BIN) a b c

$(BIN): args.rs
	mkdir -p bin/
	rustc -o $(BIN) args.rs $(FLAGS)

clean:
	-rm -rf bin/
	-rm -rf *.dSYM
