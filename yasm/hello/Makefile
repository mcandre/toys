ifeq ("${MSYSTEM}","MINGW32")
        FORMAT=win32
        EXECUTABLE=hello.exe
        PREFIX=--prefix=_
        LIBS=c:/strawberry/c/i686-w64-mingw32/lib/crt2.o -Lc:/strawberry/c/i686-w64-mingw32/lib -lmingw32 -lmingwex -lmsvcrt -lkernel32
        RUN=
else
        FORMAT=elf
        EXECUTABLE=hello
        PREFIX=
        LIBS=
        RUN=./
endif

all: test

test: $(EXECUTABLE)
	$(RUN)$(EXECUTABLE)

$(EXECUTABLE): hello.o
	ld -o $(EXECUTABLE) hello.o $(LIBS)

hello.o: hello.asm
	yasm -f $(FORMAT) -o hello.o $(PREFIX) hello.asm

clean:
	-rm $(EXECUTABLE)
	-rm hello.o