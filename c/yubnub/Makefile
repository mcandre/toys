ifeq ("${MSYSTEM}","MINGW32")
	EXECUTABLE=yubnub.exe
	RUN=
else
	EXECUTABLE=yubnub
	RUN=./
endif

all: test

test: $(EXECUTABLE)
	$(RUN)$(EXECUTABLE) g

$(EXECUTABLE): yubnub.c
	gcc -o $(EXECUTABLE) yubnub.c

lint:
	splint *.c *.h

clean:
	-rm $(EXECUTABLE)
