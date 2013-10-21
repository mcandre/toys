# Run inside of a Visual Studio command line environment
#
# Example:
#
# C:\>nmake /f Makefile.mf

CC = "cl" # Replace with your compiler
DELETE = "del"
EXECUTABLE = "swatch.exe"

all: swatch.c
	$(DELETE) $(EXECUTABLE)
	$(CC) /EHsc /D WIN32 swatch.c /Fe$(EXECUTABLE)
	$(DELETE) *.obj

lint:
	splint *.c *.h

clean:
	-$(DELETE) $(EXECUTABLE)
