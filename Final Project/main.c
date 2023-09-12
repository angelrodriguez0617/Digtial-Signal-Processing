#include <stdlib.h>
#include <stdint.h>
#include <dsplib_files/dsplib.h>
#include <dsplib_files/math.h>
#include <dsplib_files/tms320.h>
#include <stdio.h>

#define BUFFER_SIZE 2048
#define AUDIO_FILE_SIZE 1718

// declare the input array
#pragma DATA_SECTION (x,".input")
DATA x[BUFFER_SIZE];

#pragma DATA_SECTION (x_evens, ".temp")
LDATA x_evens[BUFFER_SIZE/2];

/**
 * main.c
 */

int main(void)
{
    // pointer for audio file
    FILE * audioreadptr = NULL;

    // open the big endian, binary audio file
    audioreadptr = fopen("impulse_be.bin", "rb");

    // check to make sure that
    if(audioreadptr == NULL) {
        perror("Error opening audio file");
        return(-1);
    }

    // for some reason, this is what it takes to correctly read the file
    int i;
    char tmp1, tmp2;
    for(i = 0; i < AUDIO_FILE_SIZE; i++) {
        // read two bytes from the file
        fread(&tmp1, 1, 1, audioreadptr);
        fread(&tmp2, 1, 1, audioreadptr);
        // smash the two bytes into a short (16 bits)
        x[i] = (((DATA)tmp1 << 8) | (DATA)tmp2);
    }

    // fill the rest of the buffer with zero
    for(i = AUDIO_FILE_SIZE; i < BUFFER_SIZE; i++) {
        x[i] = 0;
    }

    // close the audio file
    fclose(audioreadptr);

    rfft(x, BUFFER_SIZE, SCALE);

    /*
    // pull the even components out of x
    i = 0;
    for(i = 0; i < BUFFER_SIZE/2; i++) {
        x_evens[i] = (LDATA) x[i*2];
    }

    // pull the odd components out of x
    LDATA temp_var;
    LDATA * x_odds = (LDATA*) x;
    i = 0;
    for (i = 0; i < BUFFER_SIZE/2; i++) {
        temp_var = (LDATA) x[i*2 + 1];
        x_odds[i] = temp_var;
    }

    // perform half of the fft on each part of x
    rfft(x_evens, BUFFER_SIZE/2, NOSCALE);
    rfft(x_odds, BUFFER_SIZE/2, NOSCALE);

    LDATA temp_var_real = 0;
    LDATA temp_var_complex = 0;
    */

    x[1] = 0;
    cifft(x, BUFFER_SIZE/2, NOSCALE);

    // pointer for output file
    FILE * audiowriteptr = NULL;

    // open the big endian, binary audio file
    audiowriteptr = fopen("impulse_output_ifft.txt", "w+");

    // print the file simply since computers can use ascii formated data
    i = 0;
    for(i = 0; i < BUFFER_SIZE - 1; i++) {
        fprintf(audiowriteptr, "%d\n", x[i]);
    }
    fprintf(audiowriteptr, "%d", x[BUFFER_SIZE - 1]);

    // close the output file
    fclose(audiowriteptr);

	return 0;
}
