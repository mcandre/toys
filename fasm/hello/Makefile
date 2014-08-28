ifeq ("${MSYSTEM}","MINGW32")
	EXECUTABLE=hello.exe
	WRAPPER=hello-windows.asm
	LIBS=c:/strawberry/c/i686-w64-mingw32/lib/crt2.o -Lc:/strawberry/c/i686-w64-mingw32/lib -lmingw32 -lmingwex -lmsvcrt -lkernel32
	RUN=
else
	EXECUTABLE=hello
	WRAPPER=hello-unix.asm
	LIBS=
	RUN=./
endif

all: test

test: $(EXECUTABLE)
	$(RUN)$(EXECUTABLE)

$(EXECUTABLE): $(WRAPPER) hello.inc
	fasm $(WRAPPER) hello.o
	ld -o $(EXECUTABLE) hello.o $(LIBS)

clean:
	-rm $(EXECUTABLE)
	-rm hello.o
