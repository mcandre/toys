CC=clang
FLAGS=-O2 -Wall -Wextra -Wmost -Weverything

BIN=bin/flip

all: test

test: $(BIN) backup
	$(BIN) test.txt
	$(BIN) test.txt.flip
	md5 test.txt test.txt.bak

$(BIN): flip.c
	mkdir -p bin/
	$(CC) $(FLAGS) -o $(BIN) flip.c

backup: test.txt.bak
	cp test.txt.bak test.txt

cppcheck:
	cppcheck --quiet --enable=all --suppressions $$HOME/suppressions.cfg .

splint:
	find . -type f -name '*.[ch]' -exec splint {} \;

vera++:
	find . -type f -name '*.cpp' -o -name '*.[ch]' -exec vera++ -s {} \;

astyle-apply:
	-find . -type d -name android -prune -o -type f -name "*.java" -o -name "*.cpp" -o -name "*.[chm]" -exec astyle {} \; | grep -v Unchanged

astyle:
	-find . -type d -name android -prune -o -type f -name "*.java" -o -name "*.cpp" -o -name "*.[chm]" -exec astyle --dry-run {} \; | grep -v Unchanged

clean-astyle:
	-find . -type f -name "*.orig" -exec rm {} \;

lint: cppcheck splint vera++ astyle

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN) test.txt.flip

clean: clean-astyle
	-rm test.txt
	-rm test.txt.flip
	-rm -rf bin/
