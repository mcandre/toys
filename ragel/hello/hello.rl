#include <stdlib.h>
#include <stdio.h>
#include <string.h>

%%{
  machine hello;

  expr = "hello";

  main := |*
    expr => { printf("Hello\n"); };
  *|;

  write data;
}%%

#define BUFSIZE 128

void scanner() {
  static char buf[BUFSIZE];
  int cs, act, have = 0, curline = 1;
  char *ts, *te = 0;
  int done = 0;

  %% write init;

  while (!done) {
    char *p=buf+have, *pe, *eof=0;
    int len, space=BUFSIZE-have;

    if (space==0) {
      /* We've used up the entire buffer storing an already-parsed token
       * prefix that must be preserved. */
      fprintf(stderr, "OUT OF BUFFER SPACE\n");
      exit(1);
    }

    len=fread(p, 1, space, stdin);
    pe=p+len;

    /* Check if this is the end of file. */
    if (len<space) {
      eof=pe;
      done=1;
    }

    %% write exec;

    if (ts==0)
      have=0;
    else {
      /* There is a prefix to preserve, shift it over. */
      have=pe-ts;
      memmove(buf, ts, have);
      te=buf + (te-ts);
      ts=buf;
    }
  }
}

int main() {
  scanner();
  return 0;
}
