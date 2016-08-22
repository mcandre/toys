BIN=bin/dup

all: test

test: $(BIN)
	$(BIN) < example.txt

$(BIN): dup.go
	go build -o $(BIN) dup.go

clean:
	-rm -rf bin

