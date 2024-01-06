.POSIX:
.SILENT:
.IGNORE: clean
.PHONY: \
	all \
	lint \
	test \
	unmake \
	clean

# Linux defaults
BIN=bin/hello
OBJ=hello.o

all: test

test: $(BIN)
	$(BIN)

$(BIN): $(OBJ)
	mkdir -p bin
	ld -o $(BIN) $(OBJ)

$(OBJ): hello.s
	as -o $(OBJ) hello.s

unmake:
	unmake .

lint: unmake

clean:
	rm -rf bin
	rm $(OBJ)
