ifeq ("${MSYSTEM}","MINGW32")
	EXECUTABLE=hello.exe
	LIBS=c:/strawberry/c/i686-w64-mingw32/lib/crt2.o -Lc:/strawberry/c/i686-w64-mingw32/lib -lmingw32 -lmingwex -lmsvcrt -lkernel32
	RUN=
else
	EXECUTABLE=hello
	LIBS=
	RUN=./
endif

all: test

test: $(EXECUTABLE)
	$(RUN)$(EXECUTABLE)

$(EXECUTABLE): hello.s
	as -o hello.o hello.s
	ld -o $(EXECUTABLE) hello.o $(LIBS)

clean:
	-rm $(EXECUTABLE)
	-rm hello.o