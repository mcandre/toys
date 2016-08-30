# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
	RM=cmd /c rmdir /s /q
else
	EXTENSION=
	RM=rm -rf
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
	-$(RM) bin
