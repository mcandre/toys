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

cppcheck:
	cppcheck --quiet --enable=all --suppressions $$HOME/suppressions.cfg .

splint:
	find . -type f -name '*.[ch]' -exec splint {} \;

vera++:
	find . -type f -name '*.cpp' -o -name '*.[ch]' -exec vera++ -s {} \;

lint: cppcheck splint vera++

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN) test.txt.flip

clean:
	-rm *.exe
	-rm $(BIN)
	-rm test.txt
	-rm test.txt.flip
