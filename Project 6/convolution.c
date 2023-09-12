#include "convolution.h"

// convolution algorithm
int16_t conv(int32_t *y, int16_t *x, int16_t *h, int16_t lenx, int16_t lenh)
{
    // length of output
    int16_t conv_length;
    // iterator for x, h, and inverted x respectively
    int16_t i, j, hmin, hmax;

    // allocated convolution array
    conv_length = lenx+lenh-1;

    for(i = 0; i < conv_length; i++) {
        y[i] = 0;

        hmin = (i >= lenh - 1) ? i - (lenh - 1) : 0;
        hmax = (i < lenh - 1) ? i : lenx - 1;
        for(j = hmin; j < hmax; j++) {
            y[i] += x[j]*h[i-j];
        }
    }

    //get length of convolution array
    return conv_length;
}