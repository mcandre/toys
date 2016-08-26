BIN=bin/args

all: test

test: $(BIN)
	$(BIN) a b c

$(BIN): args.go
	go build -o $(BIN) args.go

gofmt:
	gofmt -w .

lint: gofmt

clean:
	-rm -rf bin
