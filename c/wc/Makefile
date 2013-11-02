ifeq ("${MSYSTEM}","MINGW32")
	EXECUTABLE=wc.exe
	RUN=
else
	EXECUTABLE=wc
	RUN=./
endif

all: test

test: $(EXECUTABLE)
	$(RUN)$(EXECUTABLE) < wc.c

$(EXECUTABLE): wc.c
	gcc -o $(EXECUTABLE) wc.c

lint:
	splint *.c *.h 2>&1

clean:
	-rm $(EXECUTABLE)
