ifeq ("${MSYSTEM}","MINGW32")
        FORMAT=win32
        EXECUTABLE=hello.exe
        PREFIX=--prefix _
        RUN=
else
        FORMAT=elf
        EXECUTABLE=hello
        PREFIX=
        RUN=./
endif

all: test

test: $(EXECUTABLE)
	$(RUN)$(EXECUTABLE)

$(EXECUTABLE): hello.o
	gcc -o $(EXECUTABLE) hello.o

hello.o: hello.asm
	nasm -f $(FORMAT) -o hello.o $(PREFIX) hello.asm

clean:
	-rm $(EXECUTABLE)
	-rm hello.o