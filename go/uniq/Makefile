# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
	RM=cmd /c rmdir /s /q
else
	EXTENSION=
	RM=rm -rf
endif

BIN=bin/uniq$(EXTENSION)

all: test

test: $(BIN)
	$(BIN) < example.txt

$(BIN): uniq.go
	go build -o $(BIN) uniq.go

gofmt:
	gofmt -s -w .

lint: gofmt

clean:
	-$(RM) bin
