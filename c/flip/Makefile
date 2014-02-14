CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

BIN=flip

all: test

test: $(BIN) backup
	./$(BIN) test.txt
	./$(BIN) test.txt.flip
	md5 test.txt test.txt.bak

$(BIN): flip.c
	$(CC) $(FLAGS) -o $(BIN) flip.c

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

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN) test.txt.flip

clean:
	-rm *.exe
	-rm $(BIN)
	-rm test.txt
	-rm test.txt.flip
