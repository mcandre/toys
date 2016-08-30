# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
	RM=cmd /c rmdir /s /q
else
	EXTENSION=
	RM=rm -rf
endif

BIN=bin/chop$(EXTENSION)

all: test

test: $(BIN)
	$(BIN) < example.txt

$(BIN): chop.go
	go build -o $(BIN) chop.go

clean:
	-$(RM) bin
