OUT=magic

default: test

test: magic
	./magic

magic: magic.c
	gcc -o $(OUT) -O2 -Wall magic.c

lint:
	splint +warning-stream-stdout *.c *.h

clean:
	-rm *.exe
	-rm $(OUT)
