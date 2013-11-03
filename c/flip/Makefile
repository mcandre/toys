all: test

test: flip backup
	./flip test.txt
	./flip test.txt.flip
	md5 test.txt test.txt.bak

flip: flip.c
	gcc -o flip -O2 -Wall flip.c

backup: test.txt.bak
	cp test.txt.bak test.txt

lint:
	splint *.c *.h

clean:
	-rm *.exe
	-rm flip
	-rm test.txt
	-rm test.txt.flip
