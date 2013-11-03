all: test

test: args
	./args

args: args.cpp
	g++ -O2 -Wall -o args args.cpp

lint:
	cppcheck *.cpp *.h

clean:
	-rm *.exe
	-rm args
