# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
	RM=cmd /c rmdir /s /q
else
	EXTENSION=
	RM=rm -rf
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
	-$(RM) bin
