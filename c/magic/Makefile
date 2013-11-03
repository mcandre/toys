all: test

test: magic
	./magic

magic: magic.c
	gcc -O2 -Wall -o magic magic.c

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm magic
