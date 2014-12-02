FLAGS=-O -W missing-doc -W non-uppercase-statics -W unnecessary-qualification -W unnecessary-typecast -W unused-result

BIN=bin/fizzy

all: test

test: $(BIN)
	$(BIN)

$(BIN): fizzy.rs
	mkdir -p bin/
	rustc -o $(BIN) fizzy.rs $(FLAGS)

clean:
	-rm -rf bin/
	-rm -rf *.dSYM
