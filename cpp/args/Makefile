all: test

test: args
	./args

args: args.cpp
	g++ -o args args.cpp

lint:
	cppcheck *.cpp *.h

clean:
	-rm args
