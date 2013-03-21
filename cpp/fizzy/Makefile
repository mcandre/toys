CC=g++

ifeq ("${MSYSTEM}","MINGW32")
else
	UNAME_S := $(shell uname -s)

	ifeq ($(UNAME_S),Darwin)
		CC=clang++
	endif
endif

all: test

test: fizzy
	./fizzy

fizzy: fizzy.cpp
	$(CC) -std=c++11 -stdlib=libc++ -Wl,--enable-auto-import -o fizzy fizzy.cpp

clean:
	-rm fizzy
	-rm *.exe
	-rm *.o
