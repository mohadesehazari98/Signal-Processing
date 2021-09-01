#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <float.h>
#include "Complex.h"
#define N 1024
#define PI 3.14159265

int main(){
    float dt=16000;
    //float dt=32000;
    complex a[N];
    double y[N];
    for (int i=0;i<N;i++){
        a[i] = cmplx(sin((PI * i)/4),0);
    }
    fft(a,N,dt);
    for (int i=0;i<N;i++){
        y[i]=ccabs(a[i]);
    }
    FILE* file = fopen("result.txt","w+");
    for (int i=0;i<N;i++){
        fprintf(file, "%f\n",y[i]);
    }
    fclose(file);
}
