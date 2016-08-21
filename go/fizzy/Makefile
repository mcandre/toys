BIN=bin/fizzy

all: test

test: $(BIN)
	$(BIN)

$(BIN): fizzy.go
	mkdir -p bin
	go build -o $(BIN) fizzy.go

clean:
	-rm -rf bin
