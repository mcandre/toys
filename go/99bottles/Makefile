# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
	RM=cmd /c rmdir /s /q
else
	EXTENSION=
	RM=rm -rf
endif

BIN=bin/99bottles$(EXTENSION)

all: test

test: $(BIN)
	$(BIN)

$(BIN): 99bottles.go
	go build -o $(BIN) 99bottles.go

gofmt:
	gofmt -s -w .

lint: gofmt

clean:
	-$(RM) bin
