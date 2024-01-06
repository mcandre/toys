.PHONY: \
	all \
	lint \
	test \
	unmake \
	clean

HOST_ARCH=$(shell uname -m)

TOOLCHAIN_PREFIX=riscv64-linux-gnu-

ifneq (,$(findstring riscv,$(HOST_ARCH)))
	TOOLCHAIN_PREFIX=
endif

BIN=bin/hello
OBJ=hello.o

all: test

test: $(BIN)
	$(BIN)

$(BIN): $(OBJ)
	mkdir -p bin
	$(TOOLCHAIN_PREFIX)ld -o $(BIN) $(OBJ)

$(OBJ): hello.s
	$(TOOLCHAIN_PREFIX)as -o $(OBJ) hello.s

unmake:
	unmake .

lint: unmake

clean:
	-rm -rf bin
	-rm $(OBJ)
