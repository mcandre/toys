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
	splint *.c *.h 2>&1

clean:
	-rm $(EXECUTABLE)
