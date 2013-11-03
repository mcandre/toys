all: test

test: wc
	./wc < wc.c

wc: wc.c
	gcc -O2 -Wall -o wc wc.c

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm wc
