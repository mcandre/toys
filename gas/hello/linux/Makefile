# Linux defaults
BIN=bin/hello
OBJ=hello.o

all: test

test: $(BIN)
	$(BIN)

$(BIN): $(OBJ)
	mkdir -p bin/
	ld -o $(BIN) $(OBJ)

$(OBJ): hello.s
	as -o $(OBJ) hello.s

clean:
	-rm -rf bin/
	-rm $(OBJ)
