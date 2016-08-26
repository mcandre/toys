BIN=bin/hello

all: test

test: $(BIN)
	$(BIN)

$(BIN): hello.go
	go build -o $(BIN) hello.go

gofmt:
	gofmt -s -w .

lint: gofmt

clean:
	-rm -rf bin
