#include <stdio.h>

extern int arraysum(int a[], int size);

int array[]={10, 20, 30, 40, 50};

int main (void) {

    int sum = arraysum(array, sizeof(array) / sizeof(array[0]));
    printf("%d", sum);
    return 0;
}
