default: test

test: automata
	./automata

automata: automata.c
	gcc -O2 -Wall -o automata automata.c

clean:
	-rm automata
