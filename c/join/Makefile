all: test

test: join
	./join

join: args.c join.h
	gcc -o join args.c

lint:
	splint +warning-stream-stdout *.c *.h

clean:
	rm *.exe
	rm join
