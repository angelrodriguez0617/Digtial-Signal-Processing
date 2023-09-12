#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#pragma DATA_SECTION (impulse, "MEM1");
int16_t impulse[3000];
#pragma DATA_SECTION (audio, "MEM2");
int16_t audio[3000];
#pragma DATA_SECTION (output, "MEM3");
int16_t output[4000];

void conv(int16_t *y, int16_t *x, int16_t *h, int lenx, int lenh, int *leny);

/**
 * main.c
 */
int main(void)
{

    // create pointers to audio files
    FILE * impulse_file;
    FILE * audio_file;

    // temporary values for the file reading
    int16_t tmp_read;
    int tmp_pointer = 0;

    // code to read the impulse file and store it into the impulse array
    impulse_file = fopen("impulse.bin", "r");
    if(impulse_file == NULL) {
        perror("Error opening impulse file.");
        return(-1);
    }
    // pointer, size in bytes of each element, number of elements, file stream
    fread(impulse, 2, 1826, impulse_file);
    fclose(impulse_file);

    // code to read the audio file and store it into the audio array
    tmp_pointer = 0;
    audio_file = fopen("audio.bin", "r");
    if(audio_file == NULL) {
        perror("Error opening audio file.");
        return(-1);
    }
    // pointer, size in bytes of each element, number of elements, file stream
    fread(audio, 2, 1718, audio_file);
    fclose(audio_file);

    int* leny = NULL;



    free(leny);

	return 0;
}

// convolution algorithm
void conv(int16_t *y, int16_t *x, int16_t *h, int lenx, int lenh, int *leny)
{
    // length of output
    int conv_length;
    // iterator for x, h, and inverted x respectively
    int i, j, i1;
    // temporary result of each output
    int16_t tmp;

    // allocated convolution array
    conv_length = lenx+lenh-1;

    // convolution process
    // outside loop loops through output
    for (i=0; i < conv_length; i++)
    {
        // this would point to the end of x
        i1 = lenx - i - 1;
        // temporary storage value
        tmp = 0;
        // inner loop loops through h
        for (j=0; j<lenh; j++)
        {
            // this if loop checks to make sure the parts (x) are valid
            if(i1>=0 && i1<lenx)
                // this is the summation of each multiplication for each x[-n]*h[m]
                tmp = tmp + (x[i1]*h[j]);

            // increment so that we pass through each value of x where an h exists
            i1 = i1+1;
            // assign our working value to the output signal
            y[i] = tmp;
        }
    }

    //get length of convolution array
    (*leny) = conv_length;
}
