.POSIX:
.SILENT:
.IGNORE: clean
.PHONY: all lint unmake clean

BIN=bin/hello

all: $(BIN)
	$(BIN)

$(BIN): hello.ml
	mkdir -p bin
	ocamlc -w +a -o $(BIN) hello.ml

unmake:
	unmake .

lint: unmake

clean:
	rm -rf bin
