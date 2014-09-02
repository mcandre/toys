BIN=bin/hello

all: test

test: $(BIN)
	$(BIN)

$(BIN): hello.vala
	mkdir -p bin/
	valac -o $(BIN) hello.vala

clean:
	-rm -rf bin/
