# Run inside of a Visual Studio command line environment
#
# Example:
#
# C:\>nmake /f Makefile.mf

CC = "cl" # Replace with your compiler
DELETE = "del"
EXECUTABLE = "repl.exe"

all: repl.c
	$(DELETE) $(EXECUTABLE)
	$(CC) /EHsc /D WIN32 repl.c /Fe$(EXECUTABLE)
	$(DELETE) *.obj

clean:
	$(DELETE) $(EXECUTABLE)