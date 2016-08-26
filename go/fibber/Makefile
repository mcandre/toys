BIN=bin/fibber

all: test

test: $(BIN)
	time $(BIN) 20

$(BIN): fibber.go
	go build -o $(BIN) fibber.go

gofmt:
	gofmt -w .

lint: gofmt

clean:
	-rm -rf bin
