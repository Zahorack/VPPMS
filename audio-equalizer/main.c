//
//  Audio equalizer - finite impulse response filter
//  1 x low pass, 5 x band pass, size = 6
//
//  ~concept

#include "circular.h"
// filter coefficients for 44 KHz sampling frequency
#include "original/LP500.COF"
#include "original/BP1000.COF"
#include "original/BP2000.COF"
#include "original/BP4000.COF"
#include "original/BP8000.COF"
#include "original/BP16000.COF"

#ifdef MSP
// DAC
#include "dsk6713_aic23.h"		        //codec-dsk support file
//Sampling frequency 44kHz
Uint32 fs = DSK6713_AIC23_FREQ_44KHZ;	//set sampling rate
#endif

static const uint8_t N = 101;                   //N-1 = order of filters
static const uint8_t Size = 6;

//gain
short g[Size] = {1,1,1,1,1,1};      // equalizer gains
short volume = 1;                   // volume gain
// pointers to FIR filters coefficients arrays
short *p_h[Size] = {h1, h2, h3, h4, h5, h6};
//circular buffers
circularBuffer_t c_buffs[Size];


static int finite_impulse_response(int input, circularBuffer_t *cb, short *p_cof){
    int output = 0;
    int temp;
    int sample = input;

    if(cb->count == N) {
        circular_buffer_pop(cb, &temp);
    }
    circular_buffer_push(cb, &sample);

    for(int i = 0; i< N; i++) {
        circular_buffer_value_at(cb, &temp, N-1-i);
        output += (*(p_cof + i*sizeof(short)) * temp);
    }
    //output = output >> 15;            //explicit conversion from 32bit to 16bit

    return output;
}

static int audio_equalizer(short input)	   		//ISR
{
    int result = 0;
    int yn[Size];

    for (int j = 0; j < Size; j++) {

        yn[j] = g[j] * finite_impulse_response(input, &c_buffs[j], p_h[j]);
        yn[j]= (yn[j] >> 15);				//konverzia z 32bit na 16bit

        result += yn[j];
    }

    #ifdef MSP
    output_sample(result*volume);   		//scale output filter sample
    #endif
    return (result*volume);
}

void periodic_interrupt()	   	//ISR - 44kHz
{
    #ifdef MSP
        output_sample(audio_equalizer(input_sample()));
    #endif
}

void main()
{
    #ifdef MSP
        comm_intr();               	//init DSK, codec, McBSP
    #endif
    for (int j = 0; j < Size; j++) {
        circular_buffer_init(&c_buffs[j], N, sizeof(short));
    }

    while(1);                  	//infinite loop

    for (int j = 0; j < Size; j++) {
        circular_buffer_deinit(&c_buffs[j]);
    }

}

