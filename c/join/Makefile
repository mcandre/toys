all: test

test: join
	./join

join: args.c join.h
	gcc -o join args.c

lint:
	splint *.c *.h

clean:
	rm *.exe
	rm join
