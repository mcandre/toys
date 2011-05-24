#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

char MARKER='#';
char SPACE=' ';

typedef struct automata_struct {
	int rule;
	int memory;
	int* record;
} automata;

float SCALE=1+(float) RAND_MAX;

// Based on Sean Eshbaugh's code (http://www.geekpedia.com/tutorial39_Random-Number-Generation.html)
float rand_float() {
	return rand() / SCALE;
}

automata* create_automata(int rule, int memory, int random) {
	automata* a=(automata*) malloc(sizeof(automata));

	a->rule=rule;
	a->memory=memory;

	a->record=(int*) malloc(sizeof(int)*memory);

	int i;

	if (random) {
		for (i=0; i<memory; i++) {
			a->record[i] = rand_float() > 0.5;
		}
	}
	else {
		for (i=0; i<memory; i++) a->record[i]=0;
		a->record[memory/2]=1;
	}

	return a;
}

void step(automata* a) {
	int* output=(int*) malloc(sizeof(int)*a->memory);

	int left, right, state;

	int i;
	for (i=0; i<a->memory; i++) {
		left=i-1;
		if (left<0) left=a->memory;

		right=i+1;
		if (right==a->memory) right=0;

		state=0;

		if (a->record[left]) state |= 0x04;
		if (a->record[i]) state |= 0x02;
		if (a->record[right]) state |= 0x01;

		output[i]=((a->rule >> state) & 0x01) == 1;
	}

	free(a->record);
	a->record=output;
}

char* render(automata* a) {
	char* str=(char*) malloc(a->memory+1);

	int i;
	for (i=0; i<a->memory; i++) {
		str[i] = a->record[i] ? MARKER : SPACE;
	}

	str[a->memory]='\0';

	return str;
}

void usage(char *program) {
	printf("Usage: %s [options] [rule]\n", program);
	printf("-w <width>\n");
	printf("-i <iterations>\n");
	printf("-r randomize initial conditions\n");
	printf("-h usage information\n");
	printf("Rule defaults to 110.\n");

	exit(0);
}

int main(int argc, char **argv) {
	srand((unsigned int) time(NULL));

	int rule=110;
	int width=80;
	int iterations=100;
	int random=0;

	opterr=0;

	char c;
	while ((c=getopt(argc, argv, "w:i:rh")) != -1) {
		switch(c) {
			case 'w':
				width=atoi(optarg);
				break;
			case 'i':
				iterations=atoi(optarg);
				break;
			case 'r':
				random=1;
				break;
			default:
				usage(argv[0]);
		}
	}

	if (opterr) usage(argv[0]);

	if (optind < argc) rule=atoi(argv[optind]);

	automata* a=create_automata(rule, width, random);

	int i;
	for (i=0; i<iterations; i++) {
		char* str=render(a);
		printf("%s\n", str);
		free(str);

		step(a);
	}

	return 0;
}
