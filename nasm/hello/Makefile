# FreeBSD defaults

FORMAT=-f elf
MINV=
ARCH=-arch i386
LIBS=
RUN=./
EXECUTABLE=hello
PREFIX=
ENTRY=
PIE=

# Windows
ifeq (${MSYSTEM},MINGW32)
	FORMAT=-f win32
	EXECUTABLE=hello.exe
	PREFIX=--prefix _
	ENTRY=-e _start
	ARCH=
	LIBS=c:/strawberry/c/i686-w64-mingw32/lib/crt2.o -Lc:/strawberry/c/i686-w64-mingw32/lib -lmingw32 -lmingwex -lmsvcrt -lkernel32
	ENTRY=
	RUN=
endif

# Mac OS X
ifeq ($(shell uname -s),Darwin)
	FORMAT=-f macho
	PREFIX=--prefix _
	ENTRY=-e _start
	LIBS=-lc
	MINV=-macosx_version_min 10.6
	PIE=-no_pie
endif

all: test

test: $(EXECUTABLE)
	$(RUN)$(EXECUTABLE)

$(EXECUTABLE): hello.o
	ld -o $(EXECUTABLE) hello.o $(ARCH) $(LIBS) $(MINV) $(ENTRY) $(PIE)

hello.o: hello.asm
	nasm $(FORMAT) -o hello.o $(PREFIX) hello.asm

clean:
	-rm $(EXECUTABLE)
	-rm hello.o