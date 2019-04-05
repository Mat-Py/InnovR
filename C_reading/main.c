#include <stdio.h>
#include "tree.h"

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

    char leaf = node;
    char degree = deg[leaf];
    double acc = 0;

    return acc;
}


int main() {
    double x = -1, y = -1;
    printf("%lf\n", evaluate(x, y));
    return 0;
}