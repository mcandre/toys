# FreeBSD defaults
BIN=hello
OBJ=hello.o
RUN=./
AS=as
MINV=

# Mac OS X
ifeq ($(shell uname -s),Darwin)
	FORMAT=-f macho
	AS=clang -c
	MINV=-macosx_version_min 10.6
endif

all: test

test: $(BIN)
	$(RUN)$(BIN)

$(BIN): $(OBJ)
	ld -o $(BIN) $(MINV) $(OBJ)

$(OBJ): hello.s
	$(AS) -o $(OBJ) hello.s

clean:
	-rm $(BIN)
	-rm $(OBJ)