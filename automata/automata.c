#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

typedef int bool;

#ifndef true
#define true 1
#endif

#ifndef false
#define false 0
#endif

static char MARKER = '#';
static char SPACE = ' ';

typedef struct automata_struct {
  int rule;
  int memory;
  bool* record;
} automata;

static float SCALE = 1 + (float) RAND_MAX;

// Based on Sean Eshbaugh's code (http://www.geekpedia.com/tutorial39_Random-Number-Generation.html)
static float rand_float() {
  return (float) rand() / SCALE;
}

static automata* create_automata(int rule, int memory, bool random) {
  automata* a = (automata*) malloc(sizeof(automata));

  int i;

  if (a != NULL) {
    a->rule = rule;
    a->memory = memory;

    a->record = (bool*) malloc(sizeof(bool) * memory);

    if (a->record != NULL) {
      if (random) {
        for (i = 0; i < memory; i++) {
          a->record[i] = rand_float() > 0.5;
        }
      } else {
        for (i = 0; i < memory; i++) {
          a->record[i] = 0;
        }

        a->record[memory / 2] = true;
      }
    }
  }

  return a;
}

static void step(automata* a) {
  bool* old_record;

  bool* output = (bool*) malloc(sizeof(bool) * a->memory);

  int left, right, state;

  int i;

  for (i = 0; i < a->memory; i++) {
    left = i - 1;

    if (left < 0) {
      left = a->memory;
    }

    right = i + 1;

    if (right == a->memory) {
      right = 0;
    }

    state = 0;

    if (a->record[left]) {
      state |= 0x04;
    }

    if (a->record[i]) {
      state |= 0x02;
    }

    if (a->record[right]) {
      state |= 0x01;
    }

    if (output != NULL) {
      output[i] = ((a->rule >> state) & 0x01) == 1;
    }
  }

  if (output != NULL) {
    old_record = a->record;
    a->record = output;
    free(old_record);
  }
}

static char* render(automata* a) {
  char* str = (char*) malloc(sizeof(char) * (a->memory + 1));

  if (str != NULL) {
    int i;

    for (i = 0; i < a->memory; i++) {
      str[i] = a->record[i] ? MARKER : SPACE;
    }

    str[a->memory] = '\0';
  }

  return str;
}

static void usage(char* program) {
  printf("Usage: %s [options] [rule]\n", program);
  printf("-w <width>\n");
  printf("-i <iterations>\n");
  printf("-r randomize initial conditions\n");
  printf("-h usage information\n");
  printf("Rule defaults to 110.\n");

  exit(0);
}

int main(int argc, char** argv) {
  int rule = 110;
  int width = 80;
  int iterations = 100;
  bool random = 0;
  char c;
  automata* a;
  int i;

  srand((unsigned int) time(NULL));

  opterr = 0;

  while ((int)(c = (char) getopt(argc, argv, "w:i:rh")) != -1) {
    switch (c) {
    case 'w':
      width = atoi(optarg);
      break;

    case 'i':
      iterations = atoi(optarg);
      break;

    case 'r':
      random = true;
      break;

    default:
      usage(argv[0]);
    }
  }

  if ((bool) opterr) {
    usage(argv[0]);
  }

  if (optind < argc) {
    rule = atoi(argv[optind]);
  }

  a = create_automata(rule, width, random);

  for (i = 0; i < iterations; i++) {
    char* str = render(a);
    printf("%s\n", str);
    free(str);

    step(a);
  }

  free(a->record);
  free(a);

  return 0;
}
