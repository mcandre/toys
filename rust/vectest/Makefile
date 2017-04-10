FLAGS=-O

BIN=target/debug/vectest

all: test

test: $(BIN)
	$(BIN)

$(BIN): src/bin/vectest.rs
	cargo build

clean:
	-rm -rf target
