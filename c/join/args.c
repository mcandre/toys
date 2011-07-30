#include <stdio.h>
#include <stdlib.h>
#include "join.h"

int main(int argc, char** argv) {
	char *arguments="";

	int i;
	for (i=0; i<argc; i++) {
		arguments=join(arguments, argv[i], " ");
	}

	printf("Arguments: %s\n", arguments);

	return 0;
}