# FreeBSD defaults

FORMAT=-f elf
BIN=bin/hello
OBJ=hello.o
MINV=

# Mac OS X
ifeq ($(shell uname -s),Darwin)
	FORMAT=-f macho
	MINV=-macosx_version_min 10.6
endif

all: test

test: $(BIN)
	$(BIN)

$(BIN): $(OBJ)
	mkdir -p bin
	ld -o $(BIN) $(MINV) $(OBJ)

$(OBJ): hello.asm
	nasm $(FORMAT) -o $(OBJ) hello.asm

clean:
	-rm -rf bin
	-rm *.o
