ifeq ("${MSYSTEM}","MINGW32")
        FORMAT=win
else
        FORMAT=elf
endif

all: hello

hello: hello.o
	gcc -o hello hello.o

hello.o: hello.asm
	nasm -f $(FORMAT) -l hello.lst hello.asm

clean:
	-rm hello
	-rm hello.exe