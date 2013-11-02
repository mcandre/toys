ifeq ("${MSYSTEM}","MINGW32")
	EXECUTABLE=swatch.exe
	RUN=
else
	EXECUTABLE=swatch
	RUN=./
endif

all: test

test: $(EXECUTABLE)
	$(RUN)$(EXECUTABLE)

$(EXECUTABLE): swatch.c
	gcc -o $(EXECUTABLE) swatch.c

lint:
	splint +warning-stream-stdout *.c *.h

clean:
	-rm $(EXECUTABLE)
