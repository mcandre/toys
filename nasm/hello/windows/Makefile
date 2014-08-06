# Windows defaults
FORMAT=-f win32
BIN=bin/hello
OBJ=hello.obj

all: test

test: $(BIN)
	$(BIN)

$(BIN): $(OBJ)
	mkdir -p bin/
	golink /fo $(BIN) $(OBJ) /console kernel32.dll

$(OBJ): hello.asm
	nasm $(FORMAT) -o $(OBJ) hello.asm

clean:
	-rm -rf bin/
	-rm *.o
