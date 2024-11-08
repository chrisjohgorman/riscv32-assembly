#include <stdio.h>

extern char *strncpy(char *dst, const char *src, unsigned long n);

const char *string="The quick brown fox jumped over the lazy dog.";

int main (void) {
    char destination[46];
    char *ret;
    ret = strncpy(destination, string, 40);
    printf("%s\n", destination);
    printf("%s\n", ret);
}
