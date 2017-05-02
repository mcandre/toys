FLAGS=-O

BIN=target/debug/fib

all: test

test: $(BIN)
	$(BIN)

$(BIN): src/bin/fib.rs
	cargo build

clean:
	-rm -rf target
