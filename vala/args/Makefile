FLAGS=-X -O2

BIN=bin/args

all: test

test: $(BIN)
	$(BIN) a b c

$(BIN): args.vala
	mkdir -p bin/
	valac $(FLAGS) -o $(BIN) args.vala

clean:
	-rm -rf bin/
