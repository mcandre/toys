BIN=bin/fizzy

all: test

test: $(BIN)
	$(BIN)

$(BIN): fizzy.ll
	llvm-as fizzy.ll
	llc fizzy.bc
	mkdir -p bin
	gcc -o $(BIN) fizzy.s

clean:
	-rm -rf bin
	-rm *.s
	-rm *.bc
