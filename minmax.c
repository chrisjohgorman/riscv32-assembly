#include <stdio.h>

extern void minmax(int *min, int *max, int a, int b, int c);

int main (void) {

    int a, b, c, min, max;
    
    a=9;
    b=3;
    c=5;

    minmax(&min, &max, a, b, c);
    
    printf("min is %d and max is %d\n", min, max);
    
    return 0;

}
