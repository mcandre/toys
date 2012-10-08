# Windows defaults
BIN=hello.exe
OBJ=hello.obj
RUN=

all: test

test: $(BIN)
	$(RUN)$(BIN)

$(BIN): $(OBJ)
	golink /fo $(BIN) $(OBJ) /console kernel32.dll

$(OBJ): hello.s
	as -o $(OBJ) hello.s

clean:
	-rm $(BIN)
	-rm $(OBJ)