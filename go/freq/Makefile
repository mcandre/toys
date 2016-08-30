# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
	RM=cmd /c rmdir /s /q
else
	EXTENSION=
	RM=rm -rf
endif

BIN=bin/freq$(EXTENSION)

all: test

test: $(BIN)
	$(BIN) < example.txt

$(BIN): freq.go
	go build -o $(BIN) freq.go

gofmt:
	gofmt -s -w .

lint: gofmt

clean:
	-$(RM) bin

