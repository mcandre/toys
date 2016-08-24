BIN=bin/uniq

all: test

test: $(BIN)
	$(BIN) < example.txt

$(BIN): uniq.go
	go build -o $(BIN) uniq.go

clean:
	-rm -rf bin
