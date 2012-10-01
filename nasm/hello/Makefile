# Linux defaults

FORMAT=-f elf
MINV=
ARCH=-arch i386
LIBS=-lc
RUN=./
BIN=hello
OBJ=hello.o
PREFIX=--prefix _
ENTRY=-e _start
PIE=

# Windows
ifeq (${MSYSTEM},MINGW32)
	FORMAT=-f win32
	BIN=hello.exe
	OBJ=hello.obj
	ARCH=
	LIBS=c:/strawberry/c/i686-w64-mingw32/lib/crt2.o -Lc:/strawberry/c/i686-w64-mingw32/lib -lmingw32 -lmingwex -lmsvcrt -lkernel32
	RUN=
endif

# Mac OS X
ifeq ($(shell uname -s),Darwin)
	FORMAT=-f macho
	MINV=-macosx_version_min 10.6
	PIE=-no_pie
endif

all: $(BIN)

test: $(BIN)
	$(RUN)$(BIN)

$(BIN): $(OBJ)
	ld -o $(BIN) $(OBJ) $(ARCH) $(LIBS) $(MINV) $(ENTRY) $(PIE)

$(OBJ): hello.asm
	nasm $(FORMAT) -o $(OBJ) $(PREFIX) hello.asm

clean:
	-rm $(EXECUTABLE)
	-rm $(OBJ)