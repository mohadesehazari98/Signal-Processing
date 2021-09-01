#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define NUM_SECTIONS 3
float w[3][3] ;
float G[3][1]={0.5292,0.5292,0.8102};
float a[3][2]={{-1.4804,0.8386},{0.5241,0.7525},{-0.3142,-0.1773}};
float b[3][3]={{1,-0.4059,1},{1,-1.0725,1},{1,-0.7639,1}};

/////////////////////////////////////////// Part One ////////////////////////////////////////////////////////
float Part_1(int section,float input)
{
    float yn;
    w[section][2]=input-a[section][0]*w[section][0]-a[section][1]*w[section][1];
    yn=b[section][0]*w[section][2]+b[section][1]*w[section][0] +b[section][2]*w[section][1];
    w[section][1] = w[section][0];
    w[section][0] = w[section][2];
    return yn;
}

float IIR_Filter(float input)
{

	for(int j=0; j<NUM_SECTIONS; j++)
  	{
   		w[j][0] = 0;
   		w[j][1] = 0;
   		w[j][2] = 0;
  	}

    float Out_Put;
    Out_Put = Part_1(0, input*G[0][1]);
    Out_Put = Part_1(1, Out_Put*G[1][1]);
    Out_Put = Part_1(2, Out_Put*G[2][1]);

	return Out_Put;

}


/////////////////////////////////////////// Part Two ////////////////////////////////////////////////////////

#define M_PI 3.141592
float FT(float input)
{
    int n=sizeof(input);
    float Out_put;
    for(int k=0;k<n;k++)
    {
        float sumreal=0;
        float sumimag=0;
        for(int t=0;t<n;t++)
        {
            float angle = 2 * M_PI * t * k / n;
            sumreal +=  creal(input) * cos(angle) + cimag(input) * sin(angle);
            sumimag += -creal(input) * sin(angle) + cimag(input) * cos(angle);
            Out_put = sqrt(pow(sumreal,2)+pow(sumimag,2));
            return Out_put;
        }
    }
}


/////////////////////////////////////////// Part Three ////////////////////////////////////////////////////////

float noise_generator(int fs, int t, float mu, float sigma) {

    float rand_gen() {
        // return a uniformly distributed random value
        return ( (float)(rand()) + 1. )/( (float)(RAND_MAX) + 1. );
    }
    float normalRandom() {
        // return a normally distributed random value
        float v1=rand_gen();
        float v2=rand_gen();
        return cos(2*3.14*v2)*sqrt(-2.*log(v1));
    }

    float x = normalRandom()*sigma+mu;
    return x;
}

/////////////////////////////////////////// Main Part ////////////////////////////////////////////////////////

int main()
{

    int i;
	int t = 1;
	int fs = 10;
	int mu = 0;
	int sigma = 1;
	int n=t*fs;
	float noise[n];
	float filtered_noise[n];
	float fft_filtered_noise[n*n];
	for(int i=0;i<n;i++){
        noise[i] =  noise_generator(fs, t, mu, sigma);
        filtered_noise[i] = IIR_Filter(noise[i]);
        fft_filtered_noise[4*i:4*i+3] = FT(filtered_noise[i]);
	}


	for(int i=0; i < n; k++)
	{
        printf("%f\n",noise[i]);
        printf("%f\n",fft_filtered_noise[i]);
	}




return 0;


}

