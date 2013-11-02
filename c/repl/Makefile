ifeq ("${MSYSTEM}","MINGW32")
	EXECUTABLE=repl.exe
	RUN=
else
	EXECUTABLE=repl
	RUN=./
endif

all: test

test: $(EXECUTABLE)
	echo exit | $(RUN)$(EXECUTABLE)

$(EXECUTABLE): repl.c
	gcc -o $(EXECUTABLE) repl.c

lint:
	splint +warning-stream-stdout *.c *.h

clean:
	-rm $(EXECUTABLE)
