BIN=bin/args

all: test

test: $(BIN)
	$(BIN) a b c

$(BIN): args.go
	go build -o $(BIN) args.go

clean:
	-rm -rf bin
