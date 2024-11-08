#include <stdio.h>

extern void strrev(char *str);

char string[]="The quick brown fox jumped over the lazy dog.";

int main (void) {
    strrev(string);
    printf("%s", string);
    return 0;
}
