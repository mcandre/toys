# Linux defaults
FORMAT=-f bin
BIN=hello
QFLAGS=-curses

ifeq ("${MSYSTEM}","MINGW32")
	QFLAGS=-no-kqemu
endif

all: test

test: $(BIN)
	qemu $(QFLAGS) $(BIN)

$(BIN): hello.asm
	nasm $(FORMAT) hello.asm

clean:
	-rm $(BIN)