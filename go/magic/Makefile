# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
	RM=cmd /c rmdir /s /q
else
	EXTENSION=
	RM=rm -rf
endif

BIN=bin/magic$(EXTENSION)

all: test

test: $(BIN)
	$(BIN)

$(BIN): magic.go
	go build -o $(BIN) magic.go

gofmt:
	gofmt -s -w .

lint: gofmt

clean:
	-$(RM) bin
