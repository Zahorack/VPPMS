//Discrete fourier transform of N-point from lookup table

#include <stdio.h>
#include <math.h>
#include <stdint.h>

#define DataSize 20					//number of data values for sinus
//two sine periods
short data[DataSize] = {0,602,974,974,602,0,-602,-974,-974,-602,0,602,974,974,602,0,-602,-974,-974,-602};


float discrete_fourier_transform(short *input, short frequency, int size)
{
    float sumRe = 0.0, sumIm = 0.0;            //init real/imag components
    float pi = 3.1416;

    for (int i = 0; i < size; i++) {
        sumRe += input[i]*cos(2*pi*i*frequency/size);
        sumIm += input[i]*sin(2*pi*i*frequency/size);
    }
//    printf("sumRe %f  sumIn %f \n", sumRe, sumIm);
    float amplitude = sqrt(pow(sumRe, 2) + pow(sumIm, 2));

    return amplitude;
}

int main(void)
{
    const int DiscreteFrequencyCount = 20;

    for (int j = 0; j < DiscreteFrequencyCount; j++) {

        float amplitude = discrete_fourier_transform(data, j, DataSize);
        printf("%f\n", amplitude);

    }

    return 0;
}	
