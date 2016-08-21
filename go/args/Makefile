BIN=bin/args

all: test

test: $(BIN)
	$(BIN) a b c

$(BIN): args.go
	mkdir -p bin
	go build -o $(BIN) args.go

clean:
	-rm -rf bin
