all: test

test: magic
	./magic

magic: magic.c
	gcc -o magic -O2 -Wall magic.c

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm magic
