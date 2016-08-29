BIN=bin/chop

all: test

test: $(BIN)
	$(BIN) < example.txt

$(BIN): chop.go
	go build -o $(BIN) chop.go

clean:
	-rm -rf bin
