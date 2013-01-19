#include <omp.h>
#include <stdio.h>
#include <string.h>

int main() {
	char *s = "Hello World!\n";

	int i;

	#pragma omp parallel for
	for (i = 0; i < strlen(s); i++) {
		putc(s[i], stdout);
	}

	return 0;
}
