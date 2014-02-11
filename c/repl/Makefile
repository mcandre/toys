CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

all: test

test: repl
	echo exit | ./repl

repl: repl.c
	$(CC) $(FLAGS) -o repl repl.c

splint:
	find . -type f -name '*.c' -exec splint {} \;
	find . -type f -name '*.h' -exec splint {} \;

vera++:
	find . -type f -name '*.cpp' -exec vera++ -s {} \;
	find . -type f -name '*.c' -exec vera++ -s {} \;
	find . -type f -name '*.h' -exec vera++ -s {} \;

lint: splint vera++

clean:
	-rm *.exe
	-rm repl
