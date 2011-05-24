/* From Michael Plexousakis' http://www.tem.uoc.gr/~plex/EM191/wordcount.c */

#include <stdlib.h>
#include <stdio.h>

int IN=1;
int OUT=0;

int main(int argc, char **argv) {
	int characters=0;
	int words=0;
	int lines=0;

	int state=OUT;

	char c=getchar();

	while (c!=EOF) {
		characters++;

		if (c=='\n') {
			lines++;
		}

		if (isspace(c)) {
			state=OUT;
		}
		else if (state==OUT) {
			words++;
			state=IN;
		}

		c=getchar();
	}

	printf("Characters: %d\n", characters);
	printf("Words: %d\n", words);
	printf("Lines: %d\n", lines);

	return 0;
}