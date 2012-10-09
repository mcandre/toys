# Linux defaults
FORMAT=-f bin
BIN=hello.bin
QCURSES=-curses

ifeq ("${MSYSTEM}","MINGW32")
	QCURSES=
endif

all: test

test: $(BIN)
	qemu-system-i386 $(QCURSES) -no-kvm -fda $(BIN)

$(BIN): hello.asm
	nasm -o $(BIN) $(FORMAT) hello.asm

clean:
	-rm $(BIN)
