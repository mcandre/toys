# Windows defaults
FORMAT=-f win32
BIN=hello.exe
OBJ=hello.obj
RUN=

all: test

test: $(BIN)
	$(RUN)$(BIN)

$(BIN): $(OBJ)
	golink /fo $(BIN) $(OBJ) /console kernel32.dll

$(OBJ): hello.asm
	nasm $(FORMAT) -o $(OBJ) hello.asm

clean:
	-rm $(BIN)
	-rm $(OBJ)