ifeq ("${MSYSTEM}","MINGW32")
        FORMAT=win
        EXECUTABLE=hello.exe
else
        FORMAT=elf
        EXECUTABLE=hello
endif

all: hello

hello: hello.o
	ld -o $(EXECUTABLE) hello.o

hello.o: hello.asm
	nasm -f $(FORMAT) -o hello.o hello.asm

clean:
	-rm $(EXECUTABLE)
	-rm hello.o