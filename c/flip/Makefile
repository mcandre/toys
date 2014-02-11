CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

all: test

test: flip backup
	./flip test.txt
	./flip test.txt.flip
	md5 test.txt test.txt.bak

flip: flip.c
	$(CC) $(FLAGS) -o flip flip.c

backup: test.txt.bak
	cp test.txt.bak test.txt

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
	-rm flip
	-rm test.txt
	-rm test.txt.flip
