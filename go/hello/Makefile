# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
else
	EXTENSION=
endif

BIN=bin/hello$(EXTENSION)

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
