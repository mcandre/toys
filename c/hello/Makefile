ifeq ("${MSYSTEM}","MINGW32")
	EXECUTABLE=hello.exe
	RUN=
else
	EXECUTABLE=hello
	RUN=./
endif

all: test

test: $(EXECUTABLE)
	$(RUN)$(EXECUTABLE)

$(EXECUTABLE): hello.c
	gcc -o $(EXECUTABLE) hello.c

clean:
	-rm $(EXECUTABLE)
