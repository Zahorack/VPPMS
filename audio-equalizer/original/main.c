//
//  Audio equalizer - finite impulse response filter
//  1 x low pass, 5 x band pass, size = 6
//

// filter coefficients
#include "LP500.COF"
#include "BP1000.COF"
#include "BP2000.COF"
#include "BP4000.COF"
#include "BP8000.COF"
#include "BP16000.COF"
// DAC
#include "dsk6713_aic23.h"		//codec-dsk support file


Uint32 fs=DSK6713_AIC23_FREQ_44KHZ;	//set sampling rate

#define N 101                   //N-1 = order of filters
#define Size 6

short g[6] = {1,1,1,1,1,1};     // equalizer gains
short volume = 1;               // volume gain
int yn[Size] = {0};			    //initialize filter's output
int result;
short dly[Size][N];             //delay samples

// pointers to FIR filters coefficients arrays
short *p_h[Size] = {h1, h2, h3, h4, h5, h6};


interrupt void c_int11()	   		//ISR
{
	short i, j;
	short input = input_sample();


	for (j = 0; j < Size; j++) {
    	yn[j] = 0;
		dly[j][0]= input;
			
		for (i = 0; i< N; i++) {
		   yn[j] += (*(p_h[j] + i*sizeof(short)) * dly[j][i]);   //FIR filtering
		   
	   	}
		for (i = N-1; i > 0; i--){  
	   	   dly[j][i] = dly[j][i-1]; 		
	   	}
	   	
	   	yn[j]= (g[j]*yn[j] >> 15);				//konverzia z 32bit na 16bit
   		result += yn[j];
   	}

   	output_sample(result*volume);   		//scale output filter sample
   	return;
}

void main()
{
    comm_intr();               	//init DSK, codec, McBSP
    while(1);                  	//infinite loop
}

