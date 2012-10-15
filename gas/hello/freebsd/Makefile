# FreeBSD defaults
BIN=hello
OBJ=hello.o
RUN=./
AS=as
ARCH=
MINV=

# Mac OS X
ifeq ($(shell uname -s),Darwin)
	FORMAT=-f macho
	AS=clang -c
	ARCH=-arch i386
	MINV=-macosx_version_min 10.6
endif

all: test

test: $(BIN)
	$(RUN)$(BIN)

$(BIN): $(OBJ)
	ld -o $(BIN) $(MINV) $(ARCH) $(OBJ)

$(OBJ): hello.s
	$(AS) -o $(OBJ) $(ARCH) hello.s

clean:
	-rm $(BIN)
	-rm $(OBJ)
	-rm *.ld_*