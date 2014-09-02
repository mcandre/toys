FLAGS=-X -O2

BIN=bin/hello

all: test

test: $(BIN)
	$(BIN)

$(BIN): hello.vala
	mkdir -p bin/
	valac $(FLAGS) -o $(BIN) hello.vala

clean:
	-rm -rf bin/
