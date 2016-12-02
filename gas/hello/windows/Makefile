# Windows defaults
BIN=bin/hello
OBJ=hello.obj

all: test

test: $(BIN)
	$(BIN)

$(BIN): $(OBJ)
	mkdir -p bin
	golink /fo $(BIN) $(OBJ) /console kernel32.dll

$(OBJ): hello.s
	as -o $(OBJ) hello.s

clean:
	-rm -rf bin
	-rm $(OBJ)
