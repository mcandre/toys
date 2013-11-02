ifeq ("${MSYSTEM}","MINGW32")
	EXECUTABLE=slug.exe
	RUN=
else
	EXECUTABLE=slug
	RUN=./
endif

all: test

test: $(EXECUTABLE)
	$(RUN)$(EXECUTABLE) g

$(EXECUTABLE): slug.c
	gcc -o $(EXECUTABLE) slug.c

lint:
	splint +warning-stream-stdout *.c *.h

clean:
	-rm $(EXECUTABLE)
