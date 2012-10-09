# Linux defaults
BIN=hello
OBJ=hello.o
RUN=./

all: test

test: $(BIN)
	$(RUN)$(BIN)

$(BIN): $(OBJ)
	ld -o $(BIN) $(OBJ)

$(OBJ): hello.s
	as -o $(OBJ) hello.s

clean:
	-rm $(BIN)
	-rm $(OBJ)
