BIN=bin/fibber

all: test

test: $(BIN)
	time $(BIN) 20

$(BIN): fibber.go
	go build -o $(BIN) fibber.go

clean:
	-rm -rf bin
