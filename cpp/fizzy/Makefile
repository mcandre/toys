CC=g++
LINK_OPTIONS=

ifeq ("${MSYSTEM}","MINGW32")
	LINK_OPTIONS=-Wl,--enable-auto-import
else
	ASYNC=1 # MinGW doesn't yet support threading

	UNAME_S := $(shell uname -s)

	ifeq ($(UNAME_S),Darwin)
		CC=clang++
	endif
endif

all: test

test: fizzy
	./fizzy

fizzy: fizzy.cpp
	$(CC) -std=c++11 -stdlib=libc++ $(LINK_OPTIONS) -o fizzy fizzy.cpp

clean:
	-rm fizzy
	-rm *.exe
	-rm *.o
