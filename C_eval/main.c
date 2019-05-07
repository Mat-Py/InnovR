#include <stdio.h>
#include "tree.h"
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <stdint.h>

double evaluate(double x, double y)
{
    int node = 0;
    double Es[2][2] = {{E[0][0], E[0][1]},
                       {E[1][0], E[1][1]}};
    do
    {
        int son = 0;
        double midx = (Es[0][1] + Es[0][0]) / 2.0;
        double midy = (Es[1][1] + Es[1][0]) / 2.0;

        if (x > midx) {
            son += 1;
            Es[0][0] = midx;
        }
        else
            Es[0][1] = midx;

        if (y > midy) {
            son += 2;
            Es[1][0] = midy;
        }
        else
            Es[1][1] = midy;

        node = (-id_leaf[node] -1)*4+1 + son;
    }while(id_leaf[node] < 0);

    int leaf = id_leaf[node];
    int degree = deg[leaf];
    double acc = 0;
    const double* coeff = &coeffs[id_coeffs[leaf]];

    int id_coeff = 0;

    acc += coeff[id_coeff++];

    double v[2][MAX_DEGREE];
    int v_id = 0;

    if (degree >= 1) {
        acc += coeff[id_coeff++] * x;
        acc += coeff[id_coeff++] * y;

        v[0][0] = 1;
        v[1][0] = x;
        v[1][1] = y;
        v_id = 2;
        for (int depth = 3; depth <= degree + 1; depth++) {
            for (int n = 0; n < depth; n++) {
                if (n == 0) {
                    v[(v_id)%2][n] = v[(v_id+1)%2][n] * x;
                }

                else{
                    v[(v_id)%2][n] = v[(v_id+1)%2][n-1] * y;
                }

                acc += coeff[id_coeff++] * v[(v_id)%2][n];
            }
            v_id++;
        }
    }
    return acc;
}

double peaks(double x, double y)
{
    return 3*pow((1-x), 2) *exp(-(pow(x, 2)) - pow((y+1),2)) - 10*(x/5 - pow(x,3) -
    pow(y,5))*exp(-x*x-pow(y,2)) - 1.0/3*exp(-pow((x+1),2) - pow(y, 2));
}

int mass_time_test(double (*funct)(double, double))
{
    struct timespec start, end;
    uint64_t delta_us;
    int N = 1000;

    clock_gettime(CLOCK_MONOTONIC_RAW, &start);
    for(double x = E[0][0] ; x < E[0][1] ; x += (E[0][1] - E[0][0]) / (double)N)
    {
        for(double y = E[1][0] ; y < E[1][1] ; y += (E[1][1] - E[1][0]) / (double)N) {
            evaluate(x, y);
        }
    }
    clock_gettime(CLOCK_MONOTONIC_RAW, &end);
    delta_us = (end.tv_sec - start.tv_sec) * 1000000 + (end.tv_nsec - start.tv_nsec) / 1000;
    printf("time evaluate: %lu\n", delta_us);


    clock_gettime(CLOCK_MONOTONIC_RAW, &start);
    for(double x = E[0][0] ; x < E[0][1] ; x += (E[0][1] - E[0][0]) / (double)N)
    {
        for(double y = E[1][0] ; y < E[1][1] ; y += (E[1][1] - E[1][0]) / (double)N) {
            funct(x, y);
        }
    }
    clock_gettime(CLOCK_MONOTONIC_RAW, &end);
    delta_us = (end.tv_sec - start.tv_sec) * 1000000 + (end.tv_nsec - start.tv_nsec) / 1000;
    printf("time libmath : %lu\n", delta_us);
}


int main() {
    double x = 0.4, y = 1.12;

    printf("\n%lf\n", evaluate(x, y));
    printf("%lf\n", peaks(x, y));

    mass_time_test(peaks);
    return 0;
}