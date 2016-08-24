BIN=bin/freq

all: test

test: $(BIN)
	$(BIN) < example.txt

$(BIN): freq.go
	go build -o $(BIN) freq.go

clean:
	-rm -rf bin

