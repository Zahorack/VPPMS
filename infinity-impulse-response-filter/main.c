//IIR.c  IIR filter using cascaded Direct Form II
//Coefficients a's and b's correspond to b's and a's from MATLAB

/*
 * Usage: frequency filtering
 *          Low-pass, High-pass, Band-pass, Band-stop
 *
 * Coefficients a,b -> calculate for specific filter order, sampling frequency
 *          -  Matlab "sptool" -- signal processing toolbox
 */

//Example - Low-pass 1500Hz filter
#define stages 5             	    //number of 2nd-order stages
const int a[stages][3] = {
        { 10 ,         21 ,         11},		//a10, a11, a12 for 1st stage
        {32768,      67707,      35049},		//a20, a21, a22 for 2nd stage
        {32768,      65452,      32790},		//a30, a31, a32 for 3rd stage
        {32768,      63313,      30649},		//a40, a41, a42 for 4th stage
        {32768,      62047,      29381}
};

const int b[stages][2] = {    	//denominator coefficients
        {-13113,   1499},		//b11, b12 for 1st stage
        {-13756,   3178},		//b21, b22 for 2nd stage
        {-15170,   6872},		//b31, b32 for 3rd stage
        {-17669,   13403},		//b41, b42 for 4th stage
        {-21913,   24492}       //b51, b52 for 5th stage
};

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


static void periodic_interrupt()
{
    output_sample((short)finite_impulse_response(input_sample()));
}

void main()
{
    comm_intr();                        //init DSK, codec, McBSP
    while(1);							//infinite loop
}


