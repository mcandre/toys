OUT=magic

default: test

test: magic
	./magic

magic: magic.c
	gcc -o $(OUT) -O2 -Wall magic.c

lint:
	splint *.c *.h 2>&1

clean:
	-rm *.exe
	-rm $(OUT)
