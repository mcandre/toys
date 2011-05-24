OUT=flip

default: test

test: flip backup
	./flip test.txt
	./flip test.txt.flip
	md5 test.txt test.txt.bak

flip: flip.c
	gcc -o $(OUT) -O2 -Wall flip.c

backup: test.txt.bak
	cp test.txt.bak test.txt

clean:
	-rm $(OUT)
	-rm test.txt
	-rm test.txt.flip