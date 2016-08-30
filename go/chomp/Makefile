# Windows
ifeq ($(OS),Windows_NT)
	EXTENSION=.exe
	RM=cmd /c rmdir /s /q
else
	EXTENSION=
	RM=rm -rf
endif

BIN=bin/chomp$(EXTENSION)

all: test

test: $(BIN)
	$(BIN) < example.txt

$(BIN): chomp.go
	go build -o $(BIN) chomp.go

clean:
	-$(RM) bin
