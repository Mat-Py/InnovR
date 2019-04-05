#include <stdio.h>
#include "tree.h"
#include <stdlib.h>

int get_n_from_deg(int deg)
{
    int inter = 2*(deg+1)+1;
    return (inter*inter - 1)/8;
}

double evaluate(double x, double y)
{
    char node = 0;
    double Es[2][2] = {{E[0][0], E[0][1]},
                       {E[1][0], E[1][1]}};
    do {
        char son = 0;
        double midx = (Es[0][1] + Es[0][0]) / 2;
        double midy = (Es[1][1] + Es[1][0]) / 2;
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

        node = f_son[-id_leaf[node]] + son;
    }while(id_leaf[node] < 0);

    printf("%lf %lf %lf %lf\n", Es[0][0], Es[0][1], Es[1][0],  Es[1][1]);

    char leaf = id_leaf[node];
    char degree = deg[leaf];
    double acc = 0;
    const double* coeff = &coeffs[id_coeffs[leaf]];

    printf("start coeff : %d\n", id_coeffs[leaf]);

    int id_coeff = 0;

    printf("%lf * %lf", coeff[id_coeff], 1.0);
    acc += coeff[id_coeff++];
    printf(" => acc = %lf\n", acc);

    double *v[2] = {malloc(sizeof(double) * degree), malloc(sizeof(double) * degree)};
    int v_id = 0;

    if (degree >= 1) {
        printf("%lf * %lf", coeff[id_coeff], x);
        acc += coeff[id_coeff++] * x;
        printf(" => acc = %lf\n", acc);
        printf("%lf * %lf", coeff[id_coeff], y);
        acc += coeff[id_coeff++] * y;
        printf(" => acc = %lf\n", acc);

        v[0][0] = x;
        v[0][1] = y;
        v_id = 1;

        for (int depth = 3; depth <= degree + 1; depth++) {
            for (int n = 0; n < depth; n++) {
                if (n == 0) {
                    v[(v_id)%2][n] = v[(v_id+1)%2][n] * x;
                }

                else
                {
                    v[(v_id)%2][n] = v[(v_id+1)%2][n-1] * y;
                }
                printf("%lf * %lf => acc = %lf\n", coeff[id_coeff], v[(v_id)%2][n], acc);
                acc += coeff[id_coeff++] * v[(v_id)%2][n];
                v_id++;
            }
        }
    }

    return acc;
}


int main() {
    double x = -1, y = -1;
    printf("%lf\n", evaluate(x, y));
    return 0;
}