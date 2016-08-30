# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
else
	EXTENSION=
endif

BIN=bin/lissajous$(EXTENSION)

all: test

test: $(BIN)
	$(BIN) > example.gif

$(BIN): lissajous.go
	go build -o $(BIN) lissajous.go

gofmt:
	gofmt -s -w .

lint: gofmt

clean:
	-rm -rf bin
