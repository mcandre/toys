// Copyright 2008-2014 YelloSoft

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define uint unsigned int

static /*@null@*/ char *hexTime() {
  time_t timer;
  struct tm *local;
  uint seconds;
  uint hhour;
  uint hmin;
  uint hsec;
  char *result;

  timer = time(NULL);

  local = localtime(&timer);

  if (local != NULL) {
    seconds = (unsigned int)(
      (local->tm_hour * 3600 + local->tm_min * 60 + local->tm_sec) * 65536.0 / 86400.0
    );

    hhour = seconds / 4096;

    hmin = (seconds % 4096) / 16;

    hsec = seconds % 16;

    result = (char *) malloc(sizeof(char) * 7);

    if (result != NULL) {
      int remainder = snprintf(result, 7, "%x_%02x_%x", hhour, hmin, hsec);

      if (remainder < 0 || remainder >= 7) {
        printf("Format error.\n");
      }

      return result;
    } else {
      printf("Out of memory.\n");

      return NULL;
    }
  } else {
    printf("Localtime returned NULL.\n");

    return NULL;
  }
}

int main() {
  char *h = hexTime();

  if (h != NULL) {
    printf("%s\n", h);

    free(h);
  }

  return 0;
}
