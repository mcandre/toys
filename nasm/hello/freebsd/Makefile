# FreeBSD defaults

FORMAT=-f elf
RUN=./
BIN=hello
OBJ=hello.o
ENTRY=-e _start
MINV=

# Mac OS X
ifeq ($(shell uname -s),Darwin)
	FORMAT=-f macho
	MINV=-macosx_version_min 10.6
endif

all: test

test: $(BIN)
	$(RUN)$(BIN)

$(BIN): $(OBJ)
	ld -o $(BIN) $(ENTRY) $(MINV) $(OBJ)

$(OBJ): hello.asm
	nasm $(FORMAT) -o $(OBJ) hello.asm

clean:
	-rm $(BIN)
	-rm $(OBJ)