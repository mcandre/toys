BIN=bin/fizzy

all: test

test: $(BIN)
	$(BIN)

$(BIN): fizzy.go
	go build -o $(BIN) fizzy.go

gofmt:
	gofmt -s -w .

lint: gofmt

clean:
	-rm -rf bin
