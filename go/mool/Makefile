# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
	RM=cmd /c rmdir /s /q
else
	EXTENSION=
	RM=rm -rf
endif

BIN=bin/mool$(EXTENSION)

all: test

test: $(BIN)
	$(BIN) a b c

$(BIN): mool.go
	go build -o $(BIN) mool.go

gofmt:
	gofmt -s -w .

lint: gofmt

clean:
	-$(RM) bin
