# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
	RM=cmd /c rmdir /s /q
else
	EXTENSION=
	RM=rm -rf
endif

BIN=bin/fizzy$(EXTENSION)

all: test

test: $(BIN)
	$(BIN)

$(BIN): fizzy.go
	go build -o $(BIN) fizzy.go

gofmt:
	gofmt -s -w .

lint: gofmt

clean:
	-$(RM) bin
