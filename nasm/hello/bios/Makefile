# Linux defaults
FORMAT=-f bin
BIN=bin/hello.bin
QCURSES=-curses

ifeq ("${MSYSTEM}","MINGW32")
	QCURSES=
endif

all: test

test: $(BIN)
	qemu-system-i386 $(QCURSES) -no-kvm -fda $(BIN) -boot a

$(BIN): hello.asm
	mkdir -p bin
	nasm -o $(BIN) $(FORMAT) hello.asm

clean:
	-rm -rf bin
