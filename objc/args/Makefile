FLAGS=-Wall -Wextra -Wmost -Weverything -framework Foundation -lobjc

LINUX_FLAGS=

ifneq ($(OS),Windows_NT)
	UNAME_S := $(shell uname -s)

	ifeq ($(UNAME_S),Linux)
		FLAGS=-Wall -lobjc -o Version
		LINUX_FLAGS=-I `gnustep-config --variable=GNUSTEP_SYSTEM_HEADERS` -L `gnustep-config --variable=GNUSTEP_SYSTEM_LIBRARIES` -lgnustep-base -fconstant-string-class=NSConstantString -D_NATIVE_OBJC_EXCEPTIONS
	endif
endif

BIN=args

all: test

test: $(BIN)
	./$(BIN)

$(BIN): Args.m
	clang $(FLAGS) $(LINUX_FLAGS) -o $(BIN) Args.m

lint: $(BIN)
	oclint Args.m -- $(FLAGS)

valgrind: $(BIN)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes ./$(BIN)

clean:
	-rm *.exe
	-rm $(BIN)
