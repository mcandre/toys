all: test

test: args
	./args

args: args.rs
	rustc args.rs

clean:
	-rm *.exe
	-rm args
