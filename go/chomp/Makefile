# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
else
	EXTENSION=
endif

BIN=bin/chomp$(EXTENSION)

all: test

test: $(BIN)
	$(BIN) < example.txt

$(BIN): chomp.go
	go build -o $(BIN) chomp.go

clean:
	-rm -rf bin
