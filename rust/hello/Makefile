FLAGS=-O

BIN=target/debug/hello

all: test

test: $(BIN)
	$(BIN)

$(BIN): src/bin/hello.rs
	cargo build

clean:
	-rm -rf target
