#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

////////////////////////////////////////////////Function//////////////////////////////////////////////////
#define W 0.125663706
#define N 1000
#define T 0.1


double Filter(double input)
{
    double yn,wn;
    double sin(W*T);
    double a[2];
    a[0] = -2 * cos(W*T);
    a[1] = 1;
    double w[2];
    w[0] = 0;
    w[1] = 1;
    wn = input - a[0]*w[0] - a[1]*w[1];
    yn = b*w[0];
    w[1] = w[0];
    w[0] = wn;

    return yn;
}
//////////////////////////////////////////////////Main//////////////////////////////////////////////////
int main()
{
    double x[N] = {0};
    x[0] = 1;
    double y[N] = {0};
    double input,yn;
    for (int i = 0; i < N; i++)
        {
            input = x[i];
            yn = Filter(input);
            y[i] = yn;
        }
    for (int i = 0;i<N-1;++i) {
        fprintf("%d %1f \n", i, y[i]);
    }


return 0;


}
