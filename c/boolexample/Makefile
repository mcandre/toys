OUT=boolexample

all: test

test: boolexample
	./boolexample

boolexample: boolexample.c
	gcc -o $(OUT) -O2 -Wall boolexample.c

lint:
	splint *.c *.h

clean:
	-rm $(OUT)
