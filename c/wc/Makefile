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
	splint +warning-stream-stdout *.c *.h

clean:
	-rm $(EXECUTABLE)
