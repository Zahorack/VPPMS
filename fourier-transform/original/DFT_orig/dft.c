//DFT.c DFT of N-point from lookup table. Output from watch window

#include <stdio.h>
#include <math.h> 

void dft(short *x, short k, float *out); 	//function prototype

//#define N 8					//number of data values
#define N 20					//number of data values for sinus

//short x[N] = {1,1,1,1,0,0,0,0};
//dve periody sinusu
short x[N] = {0,602,974,974,602,0,-602,-974,-974,-602,0,602,974,974,602,0,-602,-974,-974,-602};


float pi = 3.1416; 
//float sumRe, sumIm;

float foundFrequency = 0;

float out[2] = {0.0,0.0};			//init Re and Im results

int i,j;


void dft(short *x, short k, float *out)  	//DFT function{
{

	float sumRe = 0.0, sumIm = 0.0;             	//init real/imag components
	
	
	for (i=0;i<=N-1;i++)
	{
	 	
		// Put your code here
		sumRe += x[i]*cos(2*pi*i*k/N);
		sumIm += x[i]*sin(2*pi*i*k/N);
		
	}
    printf("sumRe %f  sumIn %f \n", sumRe, sumIm);
	out[0] = sumRe;                       		//sum of real components
	out[1] = sumIm;                   	   	//sum of imaginary components
}  

float Reals[N] = {0};
float Imags[N] = {0};
float Results[N] = {0};

void main()
{    

	float maxRe = 0;

	
	for (j = 0; j < N; j++)
	{
		dft(x,j,out);              	   	//call DFT function
		
		Reals[j] = out[0];
		Imags[j] = out[1];
		Results[j] = sqrt(pow(out[0], 2) + pow(out[1], 2));
        printf("%f\n", Results[j]);
		if(out[0] > maxRe){
			maxRe = out[0];
			foundFrequency = j;
		}
		
	}
	   
	foundFrequency;

}	
