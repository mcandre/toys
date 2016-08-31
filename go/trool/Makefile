# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
	RM=cmd /c rmdir /s /q
else
	EXTENSION=
	RM=rm -rf
endif

BIN=bin/trool$(EXTENSION)

all: test

test: $(BIN)
	$(BIN)

$(BIN): trool.go
	go build -o $(BIN) trool.go

gofmt:
	gofmt -s -w .

lint: gofmt

clean:
	-$(RM) bin
