all: test

test: args
	./args

args: args.m
	clang -Wall -Wextra -Wmost -framework Foundation -lobjc -o args args.m

clean:
	-rm *.exe
	-rm args
