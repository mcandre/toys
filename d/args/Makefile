FLAGS=-w -wi

all: test

test: args
	./args

args: args.d
	dmd $(FLAGS) args

clean:
	-rm *.exe
	-rm args
	-rm *.o
