# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
	RM=cmd /c rmdir /s /q
else
	EXTENSION=
	RM=rm -rf
endif

BIN=bin/ddg$(EXTENSION)

all: test

test: $(BIN)
	$(BIN) g dogs

$(BIN): ddg.go
	go build -o $(BIN) ddg.go

gofmt:
	gofmt -s -w .

lint: gofmt

clean:
	-$(RM) bin
