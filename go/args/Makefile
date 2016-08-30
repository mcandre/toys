# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
else
	EXTENSION=
endif

BIN=bin/args$(EXTENSION)

all: test

test: $(BIN)
	$(BIN) a b c

$(BIN): args.go
	go build -o $(BIN) args.go

gofmt:
	gofmt -s -w .

lint: gofmt

clean:
	-rm -rf bin
