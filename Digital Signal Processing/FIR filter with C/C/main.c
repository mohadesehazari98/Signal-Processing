#include <stdio.h>
#include <stdlib.h>
#define N 55 // filter length

float x[N]; //input buffer
int i,x_index,newest=0;
float y;
float h[N] = {-0.00120295852,-0.002395586576,-0.002043684013,-0.0004744276521, 0.002538748085,
0.00399729237, 0.002464898862,-0.002276417566, -0.00652201334,-0.006293776445,
6.722786929e-05, 0.008504665457,  0.01189410593, 0.005225163884,-0.008488573134,
-0.01879049651,  -0.0148646161, 0.004320009146,  0.02607069165,  0.03089426644,
0.007909276523, -0.03254078329, -0.05990574881, -0.04085772112,  0.03701286763,
0.1515255868,   0.2538022101,   0.2947233319,   0.2538022101,   0.1515255868,
0.03701286763, -0.04085772112, -0.05990574881, -0.03254078329, 0.007909276523,
0.03089426644,  0.02607069165, 0.004320009146,  -0.0148646161, -0.01879049651,
-0.008488573134, 0.005225163884,  0.01189410593, 0.008504665457,6.722786929e-05,
-0.006293776445, -0.00652201334,-0.002276417566, 0.002464898862,  0.00399729237,
0.002538748085,-0.0004744276521,-0.002043684013,-0.002395586576, -0.00120295852};     //filter , Extracted from Matlab workspace


void Input_Read(float arr[10000])             //input file Sine part 1
{
	FILE *f;
    float num;
    f = fopen("sine_2.txt", "r");
	//L = 1000; //length

    while(fscanf(f, "%f", &num) > 0) {
        arr[i] = num;
        i++;
	}
	fclose(f);
	i=0;
}

float FIR_filter2(float newsample)   //filter using Circular buffer
{
    ++newest;
    if (newest==N) newest=0;
    x[newest] = newsample;
    y = 0;
    x_index=newest;
    for(i=0;i<N;i++){
        y += h[i]*x[x_index];
        -- x_index;
        if (x_index == -1) x_index=N-1;
    }
    return (y);
}


int main()
{
    float sample[10000];
    float filter_sample[10000];
	Input_Read(sample);
    int k=0;
	for (k = 0; k < 10000; k++)
	{
		filter_sample[k] = FIR_filter2(sample[k]);
	}

	FILE *F;
	F = fopen("sine_2_out.txt", "w+");
	for(i = 0; i < 10000; i++)
	{
       fprintf (F, "%f \n ", filter_sample[i]);
   	}
   	fclose(F);
	return 0;
}
