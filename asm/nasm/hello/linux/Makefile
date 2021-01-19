# Linux defaults
FORMAT=-f elf
BIN=bin/hello
OBJ=hello.o

all: test

test: $(BIN)
	$(BIN)

$(BIN): $(OBJ)
	mkdir -p bin
	ld -o $(BIN) $(OBJ)

$(OBJ): hello.asm
	nasm $(FORMAT) -o $(OBJ) hello.asm

clean:
	-rm -rf bin
	-rm *.o
