# FreeBSD defaults
BIN=bin/hello
OBJ=hello.o
ARCH=
MINV=

# Mac OS X
ifeq ($(shell uname -s),Darwin)
	FORMAT=-f macho
	ARCH=-arch i386
	MINV=-macosx_version_min 10.6
endif

all: test

test: $(BIN)
	$(BIN)

$(BIN): $(OBJ)
	mkdir -p bin/
	ld -o $(BIN) $(MINV) $(ARCH) $(OBJ)

$(OBJ): hello.s
	as -o $(OBJ) $(ARCH) hello.s

clean:
	-rm -rf bin/
	-rm $(OBJ)
	-rm *.ld_*
