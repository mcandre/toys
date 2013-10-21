/* FreeBSD License

   Copyright 2010 Andrew Pennebaker. All rights reserved.

   Redistribution and use in source and binary forms, with or without modification,
   are permitted provided that the following conditions are met:

   1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
   2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation and/or
   other materials provided with the distribution.

   THIS SOFTWARE IS PROVIDED BY THE AUTHORS "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
   SHALL THE AUTHORS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
   INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
   PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
   LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
   ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. */

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

void usage(char *program) {
  printf("Usage: %s [file|file.flip]\n", program);
  printf("\nFlip will invert the bits and create a .flip file.\n");
  printf("Flipping a file twice restores the original.\n");

  exit(0);
}

int main(int argc, char **argv) {
  if (argc!=2) usage(argv[0]);

  int i;

  char *filename=argv[1];
  char *flipname;

  int len=strlen(filename);

  if (len>5 && strcmp(filename+len-5, ".flip")==0) {
    flipname=(char*) malloc(len-4);
    for (i = 0; i < len-4; i++) {
      flipname[i] = '\0';
    }

    strncpy(flipname, filename, len-5);
  }
  else {
    flipname=(char*) malloc(len+6);
    for (i = 0; i < len+6; i++) {
      flipname[i] = '\0';
    }

    strcat(flipname, filename);
    strcat(flipname, ".flip");
  }

  FILE *source=fopen(filename, "rb");
  if (source==NULL) {
    printf("Cannot read file: %s\n", filename);
    exit(1);
  }

  FILE *dest=fopen(flipname, "wb");
  if (dest==NULL) {
    fclose(source);

    printf("Cannot write file: %s\n", flipname);
    exit(1);
  }

  int b;

  while ((b=fgetc(source))!=EOF) {
    fputc(~b, dest);
  }

  fclose(dest);
  fclose(source);

  return 0;
}
