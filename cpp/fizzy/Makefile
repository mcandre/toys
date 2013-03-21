all: test

test: fizzy
	./fizzy

fizzy: fizzy.cpp
	g++ -std=c++0x -Wl,--enable-auto-import -o fizzy fizzy.cpp

clean:
	-rm fizzy
	-rm *.exe
	-rm *.o
