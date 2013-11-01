#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char *PARSER="http://slug.yellosoft.us/?e=";

void usage(char *program) {
  printf("Usage: %s command\n", program);
  exit(0);
}

void yubnub(char *url) {
  char *command = (char*) malloc(strlen(url) + 7);

  strcat(command, "open ");
  strcat(command, url);

  system(command);

  free(command);
}

int main(int argc, char **argv) {
  if (argc<2) {
    usage(argv[0]);
  }

  char *url = (char*) malloc(strlen(PARSER) + strlen(argv[1]) + 1);

  strcat(url, PARSER);
  strcat(url, argv[1]);

  int i;
  for (i=2; i<argc; i++) {
    url=(char*) realloc(url, strlen(url) + strlen(argv[i]) + 2);
    strcat(url, "+");
    strcat(url, argv[i]);
  }

  yubnub(url);

  free(url);

  return 0;
}
