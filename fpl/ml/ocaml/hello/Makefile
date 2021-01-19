BIN=bin/hello

all: $(BIN)
	$(BIN)

$(BIN): hello.ml
	mkdir -p bin/
	ocamlc -w +a -o $(BIN) hello.ml

clean:
	-rm -rf bin/
