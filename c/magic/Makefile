CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

all: test

test: magic
	./magic

magic: magic.c
	$(CC) $(FLAGS) -o magic magic.c

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
	-rm magic
