FLAGS=-Wall -Wextra -Wmost -Weverything -framework Foundation -lobjc -o args

all: test

test: args
	./args

args: args.m
	clang $(FLAGS) args.m

lint:
	oclint args.m -- $(FLAGS)

clean:
	-rm *.exe
	-rm args
