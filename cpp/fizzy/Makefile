CC=g++
FLAGS=-O2 -Wall -Wextra -Weffc++
LINK_OPTIONS=
STD=

ifeq ("${MSYSTEM}","MINGW32")
	LINK_OPTIONS=-Wl,--enable-auto-import
else
	ASYNC=1 # MinGW x86 doesn't yet support threading
	STD=-std=c++11 -stdlib=libc++ # MinGW x86 doesn't yet support C++11
	AUTO=1

	UNAME_S := $(shell uname -s)

	ifeq ($(UNAME_S),Darwin)
		CC=clang++
		FLAGS=-O2 -Wall -Wextra -Weffc++ -Wmost -Weverything
	endif
endif

all: test

test: fizzy
	./fizzy

fizzy: fizzy.cpp
	$(CC) $(FLAGS) $(STD) $(LINK_OPTIONS) -o fizzy fizzy.cpp

lint:
	cppcheck --enable=all --suppress=missingIncludeSystem .

clean:
	-rm *.exe
	-rm fizzy
