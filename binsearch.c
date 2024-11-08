#include <stdio.h>

const int array[] = {1 ,9 ,10 ,12 ,29 ,34 ,45 ,51 ,54, 61 ,71 ,79 ,80 ,88 ,92 ,93 ,94 ,101 ,115 ,118 ,123};

extern int binsearch(const int arr[], int needle, int size);

int main (void) {
    
    int needle = 62;
    int size = 21;
    int mid;

    mid = binsearch(array, needle, size);

    printf("found element %d\n", mid);

    return 0;
}
