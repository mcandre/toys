# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
else
	EXTENSION=
endif

BIN=bin/chop$(EXTENSION)

all: test

test: $(BIN)
	$(BIN) < example.txt

$(BIN): chop.go
	go build -o $(BIN) chop.go

clean:
	-rm -rf bin
