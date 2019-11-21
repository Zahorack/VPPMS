//IIR.c  IIR filter using cascaded Direct Form II
//Coefficients a's and b's correspond to b's and a's from MATLAB

#include "DSK6713_AIC23.h"			    //codec-DSK support file
Uint32 fs=DSK6713_AIC23_FREQ_8KHZ; 	    //set sampling rate
#include "bp1500.cof"       	        //BS @ 1750 Hz coefficient file


static int finite_impulse_response(int input){
    static short dly[stages][2] = {0};             //delay samples per stage
    int un, yn;

    for (int i = 0; i < stages; i++)            //repeat for each stage
    {
        un = input - ((b[i][0] * dly[i][0])>>15) - ((b[i][1] * dly[i][1])>>15);

        yn = ((a[i][0]*un)>>15) + ((a[i][1] * dly[i][0])>>15) + ((a[i][2] * dly[i][1])>>15);

        dly[i][1] = dly[i][0]; 	            //update delays
        dly[i][0] = un;                     //update delays
        input = yn;  			        	//intermediate output->input to next stage
    }

    return yn;							    //return from ISR
}


interrupt void c_int11()
{
    output_sample((short)finite_impulse_response(input_sample()));
}

void main()
{
    comm_intr();                        //init DSK, codec, McBSP
    while(1);							//infinite loop
}


