BIN=bin/chomp

all: test

test: $(BIN)
	$(BIN) < example.txt

$(BIN): chomp.go
	go build -o $(BIN) chomp.go

clean:
	-rm -rf bin
