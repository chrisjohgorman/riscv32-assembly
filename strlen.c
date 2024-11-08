#include<stdio.h>

extern int strlen(const char *s);

const char *string="The quick brown fox jumped over the lazy dog.";

int main (void) {
    int a;
    a = strlen(string);
    printf("%d", a);
}
