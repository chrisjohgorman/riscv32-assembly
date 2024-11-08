#include <stdio.h>
#include <math.h>

struct Coordinate {
    float x;
    float y;
};


extern "C" {
    extern float distance(const Coordinate &to, const Coordinate &from);
}

const struct Coordinate a = { 1, 3 };
const struct Coordinate b = { 3, 7 };

/*
float distance(const struct Coordinate &to, const struct Coordinate &from) {
    float x = to.x - from.x;
    float y = to.y - from.y;
    return sqrt(x*x + y*y);
}
*/
int main (void) {

    float len = distance(a, b);
    printf("len is %f\n", len);
    return 0;

}
