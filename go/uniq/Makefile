BIN=bin/uniq

all: test

test: $(BIN)
	$(BIN) < example.txt

$(BIN): uniq.go
	go build -o $(BIN) uniq.go

gofmt:
	gofmt -w .

lint: gofmt

clean:
	-rm -rf bin
