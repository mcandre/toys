all: test

test: args
	./args

args: args.cpp
	g++ -O2 -Wall -Wextra -o args args.cpp

lint:
	cppcheck --enable=all --suppress=missingIncludeSystem .

clean:
	-rm *.exe
	-rm args
