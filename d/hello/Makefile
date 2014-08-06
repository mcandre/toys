FLAGS=-w -wi

BIN=bin/hello

all: test

test: $(BIN)
	$(BIN)

$(BIN): hello.d
	mkdir -p bin/
	dmd $(FLAGS) -of$(BIN) hello

clean:
	-rm -rf bin/
	-rm *.o
