#include <stdio.h>

extern void stringcopy(char *dst, const char *src);

const char *string="The quick brown fox jumped over the lazy dog.";

int main (void) {
    char destination[46];
    stringcopy(destination, string);
    printf("%s\n", destination);
}
