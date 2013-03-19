all: test

test: fizzy
	./fizzy

fizzy: fizzy.cpp
	g++ -o fizzy fizzy.cpp

clean:
	-rm fizzy
	-rm *.exe
	-rm *.o
