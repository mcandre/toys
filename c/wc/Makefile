all: test

test: wc
	./wc < wc.c

wc: wc.c
	gcc -o wc -O2 -Wall wc.c

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm wc
