# Linux defaults
FORMAT=-f elf
RUN=./
BIN=hello
OBJ=hello.o

all: test

test: $(BIN)
	$(RUN)$(BIN)

$(BIN): $(OBJ)
	ld -o $(BIN) $(OBJ)

$(OBJ): hello.asm
	nasm $(FORMAT) -o $(OBJ) hello.asm

clean:
	-rm $(BIN)
	-rm $(OBJ)
