# Linux defaults
FORMAT=-f bin
BIN=hello
QCURSES=-curses
DISK=disk.img
SIZE=512 # bytes

ifeq ("${MSYSTEM}","MINGW32")
	QCURSES=
endif

all: test

test: $(DISK)
	qemu-system-i386 $(QCURSES) -no-kvm -fda $(DISK)

$(BIN): hello.asm
	nasm -o $(BIN) $(FORMAT) hello.asm

$(DISK): $(BIN)
	qemu-img create $(DISK) $(SIZE)
	dd if=$(BIN) of=$(DISK)

clean:
	-rm $(DISK)
	-rm $(BIN)
