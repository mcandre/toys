all: test

test: args
	./args

args: args.oz
	ozc -x args.oz

clean:
	-rm args
	-rm *.exe
