//
// Created by zahorack on 11/17/19.
//

// Digital signal processing
// Method: FIR Filter - finite impulse response
// Usage:  Frequency filtering low-pass, band-pass, band-stop

//#include "lp1500_256.cof"             // Low-pass filter frequency 1500 Hz
//#include "bs790.cof"                  // Band-stop filter frequency 790 Hz
//#include "BP1750.COF"                 // Band-pass filter frequency 1750 Hz
#include "sp_cv09-FIR/BS2700.COF"       // Band-stop filter frequency 2700 Hz
#include "dsk6713_aic23.h"		        //codec-dsk support file
#include "circular.h"
Uint32 fs = DSK6713_AIC23_FREQ_8KHZ;    //set sampling rate

circularBuffer_t data;

static int finite_impulse_response(int input){
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
    //output = output >> 15;            //explicit conversion from 32bit to 16bit

    return output;
}


interrupt void c_int11()	   	//ISR
{
    output_sample(finite_impulse_response(input_sample()));
}

void main()
{
    circular_buffer_init(&data, N, sizeof(int));

    comm_intr();               	//init DSK, codec, McBSP
    while(1);                  	//infinite loop

    circular_buffer_deinit(&data);
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

    return output;
}

