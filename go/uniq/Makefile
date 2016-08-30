# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
else
	EXTENSION=
endif

BIN=bin/uniq$(EXTENSION)

all: test

test: $(BIN)
	$(BIN) < example.txt

$(BIN): uniq.go
	go build -o $(BIN) uniq.go

gofmt:
	gofmt -s -w .

lint: gofmt

clean:
	-rm -rf bin
