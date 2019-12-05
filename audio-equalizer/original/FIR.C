//Fir.c  FIR filter. Include coefficient file with length N


#include "LP500.COF"
#include "BP1000.COF"	            	//coefficient file 
#include "BP2000.COF"
#include "BP4000.COF"
#include "BP8000.COF"
#include "BP16000.COF"

#include "dsk6713_aic23.h"		//codec-dsk support file

#define N 101
#define Size 6


short g[6] = {1,1,1,1,1,1};
short gain = 1;

//short h[6][101]; = {h1, h2, h3, h4, h5, h6};

short *p_h[Size] = {h1, h2, h3, h4, h5, h6};

//h[0] = h1;
// 


Uint32 fs=DSK6713_AIC23_FREQ_44KHZ;	//set sampling rate
int yn[Size] = {0};							//initialize filter's output
int result;
short dly[Size][N];                    	//delay samples

interrupt void c_int11()	   		//ISR
{
	short i;
	int j;
   	
   

   	                   
	for (j = 0; j < Size; j++) {
    	yn[j] = 0;
		dly[j][0]= input_sample();		//input newest sample
			
		for (i = 0; i< N; i++) {
		   yn[j] += (*(p_h[j] + i*sizeof(short)) * dly[j][i]);  	//y(n) += h(i)* x(n-i)
		   
	   	}
		   
		for (i = N-1; i > 0; i--){  
	   	   dly[j][i] = dly[j][i-1]; 		
	   	}
	   	
	   	yn[j]= (g[j]*yn[j] >> 15);				//converzia z 32bit na 16bit
	   	
   		result += yn[j];
   	}
   	
   	
   	output_sample(result*gain);   		//scale output filter sample
   	return;
}

void main()
   {
  	comm_intr();               	//init DSK, codec, McBSP
  	while(1);                  	//infinite loop
   }

