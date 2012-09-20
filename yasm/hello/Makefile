ifeq ("${MSYSTEM}","MINGW32")
        FORMAT=win32
        EXECUTABLE=hello.exe
else
        FORMAT=elf
        EXECUTABLE=hello
endif

all: hello

hello: hello.o
	gcc -o $(EXECUTABLE) hello.o

hello.o: hello.asm
	yasm -f $(FORMAT) -o hello.o hello.asm

clean:
	-rm $(EXECUTABLE)
	-rm hello.o