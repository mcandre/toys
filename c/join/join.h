#include <string.h>

char *join(char *a, char *b, char *sep) {
  int len_a = (int) strlen(a);
  int len_b = (int) strlen(b);
  int len_sep = (int) strlen(sep);

  if (a == NULL) {
    len_a = 0;
  }
  if (b == NULL) {
    len_b = 0;
  }
  if (sep == NULL) {
    sep = "";
    len_sep = 0;
  }

  if (len_a == 0 && len_b == 0) {
    return "";
  }
  else if (len_a == 0) {
    return b;
  }
  else if (len_b == 0) {
    return a;
  }
  else {
    char *result=(char*) malloc(len_a + len_b + len_sep + 1);

    result = strcpy(result, a);
    result = strcat(result, sep);
    return strcat(result, b);
  }
}
