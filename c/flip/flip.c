//
// Copyright 2010-2014 YelloSoft. All rights reserved.

// Redistribution and use in source and binary forms, with or without modification, are permitted
// provided that the following conditions are met:

// Redistributions of source code must retain the above copyright notice, this list of conditions
// and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of
// conditions and the following disclaimer in the documentation and/or other materials provided
// with the distribution.
// THIS SOFTWARE IS PROVIDED BY THE FREEBSD PROJECT ``AS IS'' AND ANY EXPRESS OR IMPLIED
// WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE FREEBSD PROJECT OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
// OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// The views and conclusions contained in the software and documentation are those of the authors
// and should not be interpreted as representing official policies, either expressed or implied, of
// YelloSoft.
//

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

static void __attribute__((noreturn)) usage(char* const program) {
  printf("Usage: %s [file|file.flip]\n", program);
  printf("\nFlip will invert the bits and create a .flip file.\n");
  printf("Flipping a file twice restores the original.\n");

  exit(0);
}

int main(int const argc, char** const argv) {
  char* filename;
  char* flipname;
  size_t len;
  FILE* source;
  FILE* dest;
  int b;

  if (argc != 2) {
    usage(argv[0]);
  }

  filename = argv[1];

  len = strlen(filename);

  if (len > 5 && strcmp(filename + len - 5, ".flip") == 0) {
    flipname = (char*) calloc(len - 4, sizeof(char));

    if (flipname == NULL) {
      printf("Out of memory.\n");
      exit(EXIT_FAILURE);
    }

    strncpy(flipname, filename, len - 5);
  }
  else {
    flipname = (char*) calloc(len + 6, sizeof(char));

    if (flipname == NULL) {
      printf("Out of memory.\n");
      exit(EXIT_FAILURE);
    }

    strcat(flipname, filename);
    strcat(flipname, ".flip");
  }

  source = fopen(filename, "rb");

  if (source == NULL) {
    printf("Cannot read file: %s\n", filename);
    exit(EXIT_FAILURE);
  }

  dest = fopen(flipname, "wb");

  if (dest == NULL) {
    if (fclose(source) == EOF) {
      printf("Failure closing source file.\n");
    }

    printf("Cannot write file: %s\n", flipname);
    exit(EXIT_FAILURE);
  }

  while ((b = fgetc(source)) != EOF) {
    if (fputc(~b, dest) == EOF) {
      printf("Error writing to file.\n");
      exit(EXIT_FAILURE);
    }
  }

  if (fclose(dest) == EOF) {
    printf("Error closing destination file.\n");
  }

  if (fclose(source) == EOF) {
    printf("Error closing source file.\n");
  }

  free(flipname);

  return 0;
}
