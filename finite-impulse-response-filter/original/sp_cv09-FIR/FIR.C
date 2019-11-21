//Fir.c  FIR filter. Include coefficient file with length N

#include "BS2700.COF"	            	//coefficient file 
#include "dsk6713_aic23.h"		        //codec-dsk support file
Uint32 fs=DSK6713_AIC23_FREQ_8KHZ;	    //set sampling rate
int yn = 0;				                //initialize filter's output
short dly[N];                    	    //delay samples

interrupt void c_int11()	   	//ISR
{
	short i;
   	
   	dly[0]=input_sample();		//input newest sample
   	yn = 0;                    	//initialize filter's output
	for (i = 0; i< N; i++)
	   yn += (h[i] * dly[i]);  	//y(n) += h(i)* x(n-i)

	for (i = N-1; i > 0; i--)  	//starting @ end of buffer
   	   dly[i] = dly[i-1];      	//update delays with data move
   	   yn=yn >> 15;

   	output_sample(yn);   		//scale output filter sample
   	return;
}

void main()
   {
  	comm_intr();               	//init DSK, codec, McBSP
  	while(1);                  	//infinite loop
   }

