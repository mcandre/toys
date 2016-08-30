# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
else
	EXTENSION=
endif

BIN=bin/fibber$(EXTENSION)

all: test

test: $(BIN)
	time $(BIN) 20

$(BIN): fibber.go
	go build -o $(BIN) fibber.go

gofmt:
	gofmt -s -w .

lint: gofmt

clean:
	-rm -rf bin
