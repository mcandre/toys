# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
else
	EXTENSION=
endif

BIN=bin/freq$(EXTENSION)

all: test

test: $(BIN)
	$(BIN) < example.txt

$(BIN): freq.go
	go build -o $(BIN) freq.go

gofmt:
	gofmt -s -w .

lint: gofmt

clean:
	-rm -rf bin

