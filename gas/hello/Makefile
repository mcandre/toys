# Linux defaults

BIN=hello
OBJ=hello.o
ARCH=-arch i386
ENTRY=-e _main
MINV=
LIBS=-lc
RUN=./
PIE=

ifeq ("${MSYSTEM}","MINGW32")
	BIN=hello.exe
	OBJ=hello.obj
	ARCH=
	LIBS=c:/strawberry/c/i686-w64-mingw32/lib/crt2.o -Lc:/strawberry/c/i686-w64-mingw32/lib -lmingw32 -lmingwex -lmsvcrt -lkernel32
	RUN=
# Mac OS X
else ifeq ($(shell uname -s),Darwin)
	MINV=-macosx_version_min 10.6
	PIE=-no_pie
endif

all: $(BIN)

test: $(BIN)
	$(RUN)$(BIN)

$(BIN): $(OBJ)
	ld -o $(BIN) $(OBJ) $(ARCH) $(LIBS) $(MINV) $(ENTRY) $(PIE)

$(OBJ): hello.s
	as -o $(OBJ) hello.s $(ARCH)

clean:
	-rm $(BIN)
	-rm $(OBJ)