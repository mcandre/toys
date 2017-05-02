FLAGS=-O

BIN=target/debug/args

all: test

test: $(BIN)
	$(BIN) a b c

$(BIN): src/bin/args.rs
	cargo build

clean:
	-rm -rf target
