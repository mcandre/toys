/* Andrew Pennebaker (andrew.pennebaker@gmail.com)
   Copyright 2008 Andrew Pennebaker */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define uint unsigned int

char *hexTime() {
  time_t timer;
  struct tm *local;

  timer = time(NULL);

  local = localtime(&timer);

  uint seconds = (unsigned int) ((local->tm_hour * 3600 + local->tm_min * 60 + local->tm_sec) * 65536.0 / 86400.0);

  uint hhour=seconds/4096;

  uint hmin=(seconds%4096)/16;

  uint hsec=seconds%16;

  char *result = (char *) malloc(sizeof(char) * 7);

  if (result != NULL) {
    snprintf(result, 7, "%x_%02x_%x", hhour, hmin, hsec);
    return result;
  }
  else {
    return "error";
  }
}

int main() {
  char *h = hexTime();

  printf("%s\n", h);

  free(h);

  return 0;
}
