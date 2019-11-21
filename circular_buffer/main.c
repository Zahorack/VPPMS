#include "circular.h"
#include <stdio.h>

circularBuffer_t buf;

static int new_fir_filter_implementation(int);
static int old_fir_filter_implementation(int);

#define N 5                             //order of FIR filter
const int coeffs[N] = {1, 2, 3, 4, 5};  //finite impulse response filter coefficients


int main() {

    circular_buffer_init(&buf, N, sizeof(int));

    for(int i = 0; i < 20; i++) {
        new_fir_filter_implementation(i);
//        old_fir_filter_implementation(i);
    }

    circular_buffer_deinit(&buf);
    return 0;
}


static int new_fir_filter_implementation(int input) {
    int output = 0;
    int temp;
    int sample = input;

    if(buf.count == N) {
        circular_buffer_pop(&buf, &temp);
    }
    circular_buffer_push(&buf, &sample);

    for(int i = 0; i< N; i++) {
        circular_buffer_value_at(&buf, &temp, N-1-i);
        output += (coeffs[i] * temp);
    }
    //yn=yn >> 15;                              //explicit conversion from 32bit to 16bit

    printf("%d\n", output);
    return output;
}


/*
 *  Problem with old version of FIR filter implementation is unefficient data ordering.
 *  This issue should solve circular buffer
 */
static int old_fir_filter_implementation(int input) {
    int output = 0;				                //initialize filter's output
    static int dly[N] = {0};

    dly[0] = input;		                        //input newest sample
                 	                            //initialize filter's output
    for (int i = 0; i< N; i++)
        output += (coeffs[i] * dly[i]);  	    //y(n) += h(i)* x(n-i)
    for (int i = N-1; i > 0; i--)  	            //starting @ end of buffer
        dly[i] = dly[i-1];      	            //update delays with data move
    //yn=yn >> 15;                              //explicit conversion from 32bit to 16bit

    printf("%d\n", output);
    return output;
}