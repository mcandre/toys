all: test

test: args
	./args

args: args.d
	dmd args

clean:
	-rm *.exe
	-rm args
	-rm *.o
