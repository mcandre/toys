BIN=bin/freq

all: test

test: $(BIN)
	$(BIN) < example.txt

$(BIN): freq.go
	go build -o $(BIN) freq.go

gofmt:
	gofmt -s -w .

lint: gofmt

clean:
	-rm -rf bin

