//
// Copyright 2009-2014 YelloSoft. All rights reserved.

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
#include <stdio.h>
#include <string.h>

#define PROGRAM "REPL"

#define VERSION "1.0.0"

#define COPYRIGHT "Copyright 2009 YelloSoft"

#define WELCOME "Use \'exit\' or Control-C to quit."

#define PROMPT "> "

#define EXIT "exit"

static void __attribute__((noreturn)) usage(char* const program) {
  printf("Usage: %s <script>\n", program);
  printf("\n-h --help\tDisplay usage\n");
  printf("-v --version\tDisplay version\n");

  exit(0);
}

static void __attribute__((noreturn)) version() {
  printf("%s %s\n", PROGRAM, VERSION);
  exit(0);
}

static void welcome() {
  printf("%s %s - %s\n", PROGRAM, VERSION, COPYRIGHT);
  printf("%s\n", WELCOME);
}

static void interactive() {
  char* command;

  welcome();

  command = (char*) malloc(1024);

  if (command != NULL) {
    do {
      printf(PROMPT);
      (void) scanf("%s", command);
    } while (strcmp(command, EXIT) != 0);
  }

  free(command);
}

static void run(char* const script) {
  FILE *f = fopen(script, "rb");

  if (f == NULL) {
    printf("Error: Cannot read script %s\n", script);
  }
  else {
    int c = fgetc(f);
    while (c != EOF) {
      (void) putchar(c);
      c = fgetc(f);
    }

    (void) fclose(f);
  }
}

int main(int const argc, char** const argv) {
  if (argc<2) {
    interactive();
  }
  else {
    int i;
    for (i=1; i<argc; i++) {
      if (strcmp(argv[i], "-h") == 0 || strcmp(argv[i], "--help") == 0) {
        usage(argv[0]);
      }
      else if (strcmp(argv[i], "-v") == 0 || strcmp(argv[i], "--version") == 0) {
        version();
      }
    }

    run(argv[1]);
  }

  return 0;
}
