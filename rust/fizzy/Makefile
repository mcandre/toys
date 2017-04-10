FLAGS=-O

BIN=target/debug/fizzy

all: test

test: $(BIN)
	$(BIN)

$(BIN): src/bin/fizzy.rs
	cargo build

clean:
	-rm -rf target
