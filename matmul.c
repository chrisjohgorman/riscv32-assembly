#include <stdio.h>

int matrix[3][3] = { {1, 2, 3}, {4, 5, 6}, {7, 8, 9} };
int vector[3] = { 1, 2, 3 };
int dst[3];

extern void matmul(int dst[3], int matrix[3][3], int vector[3]);
/*
void matmul(int dst[3], int matrix[3][3], int vector[3]) {
    int r;
    int c;
    float d;
    for (r = 0;r < 3;r++) {
        d = 0;
        for (c = 0;c < 3;c++) {
             d = d + matrix[r][c] * vector[c];
        }
        dst[r] = d;
    }
}
*/

int main (void) {
    
    matmul(dst, matrix, vector);

    printf("dst = {%d, %d, %d}\n", dst[0], dst[1], dst[2]);
}
