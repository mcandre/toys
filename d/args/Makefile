FLAGS=-w -wi

BIN=bin/args

all: test

test: $(BIN)
	$(BIN) a b c

$(BIN): args.d
	mkdir -p bin/
	dmd $(FLAGS) -of$(BIN) args

clean:
	-rm -rf bin/
	-rm *.o
