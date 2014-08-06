BIN=bin/vectest

all: test

test: $(BIN)
	$(BIN)

$(BIN): vectest.rs
	mkdir -p bin/
	rustc -o $(BIN) vectest.rs

clean:
	-rm -rf bin/
	-rm -rf *.dSYM
