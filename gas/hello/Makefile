LIBS=c:/strawberry/c/bin/../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/lib/crt2.o c:/strawberry/c/bin/../lib/gcc/i686-w64-mingw32/4.4.3/crtbegin.o -Lc:/strawberry/c/bin/../lib/gcc/i686-w64-mingw32/4.4.3 -Lc:/strawberry/c/bin/../lib/gcc -Lc:/strawberry/c/bin/../lib/gcc/i686-w64-mingw32/4.4.3 -Lc:/strawberry/c/bin/../lib/gcc/i686-w64-mingw32/4.4.3/../../../../lib32/../lib32 -Lc:/strawberry/c/bin/../lib/gcc/i686-w64-mingw32/4.4.3/../../../../lib32 -Lc:/strawberry/c/bin/../lib/gcc/i686-w64-mingw32/4.4.3/../../../../lib32 -Lc:/strawberry/c/bin/../lib/gcc/i686-w64-mingw32/4.4.3 -Lc:/strawberry/c/bin/../lib/gcc -Lc:/strawberry/c/bin/../lib/gcc/i686-w64-mingw32/4.4.3/../../../../lib32 -Lc:/strawberry/c/bin/../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/lib -Lc:/strawberry/c/bin/../lib/gcc/i686-w64-mingw32/4.4.3/../../.. -L/mingw/lib -Lc:/strawberry/c/bin/../lib/gcc/i686-w64-mingw32/4.4.3/../../../../i686-w64-mingw32/lib -Lc:/strawberry/c/bin/../lib/gcc/i686-w64-mingw32/4.4.3/../../.. -L/mingw/lib -lmingw32 -lgcc_eh -lgcc -lmoldname -lmingwex -lmsvcrt -luser32 -lkernel32

ifeq ("${MSYSTEM}","MINGW32")
	EXECUTABLE=hello.exe
	RUN=
else
	EXECUTABLE=hello
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