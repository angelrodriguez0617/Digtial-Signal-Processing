#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include "convolution.h"

int32_t y[9] = {0};
int16_t x[5] = {1, 2, 3, 4, 5};
int16_t h[5] = {1, 2, 3, 4, 5};

int main(void) {

    int16_t leny = conv(y, x, h, 5, 5);

    int k = 0;
    for (k = 0; k < leny; k++) {
        printf("%d\n", y[k]);
    }

    return 0;
}