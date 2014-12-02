FLAGS=-O -W missing-doc -W non-uppercase-statics -W unnecessary-qualification -W unnecessary-typecast -W unused-result

BIN=bin/vectest

all: test

test: $(BIN)
	$(BIN)

$(BIN): vectest.rs
	mkdir -p bin/
	rustc -o $(BIN) vectest.rs $(FLAGS)

clean:
	-rm -rf bin/
	-rm -rf *.dSYM
