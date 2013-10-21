all: hello

test: hello
	./hello

hello: hello.cpp
	g++ -o hello hello.cpp

lint:
	cppcheck *.cpp *.h

clean:
	-rm hello
