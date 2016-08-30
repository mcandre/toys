# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
	RM=cmd /c rmdir /s /q
else
	EXTENSION=
	RM=rm -rf
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
	-$(RM) bin
