# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
	RM=cmd /c rmdir /s /q
else
	EXTENSION=
	RM=rm -rf
endif

BIN=bin/lissajous$(EXTENSION)

all: test

test: $(BIN)
	$(BIN) > example.gif

$(BIN): lissajous.go
	go build -o $(BIN) lissajous.go

gofmt:
	gofmt -s -w .

lint: gofmt

clean:
	-$(RM) bin
