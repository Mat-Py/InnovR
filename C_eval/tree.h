#ifndef TREE_H
#define TREE_H

#define N_LEAVES 16
#define N_FATHERS 6
#define N_COEFFS 2166
#define N_NODES N_LEAVES + N_FATHERS
#define MAX_DEGREE 5
#define NB_BITS (unsigned int)1.585

const int id_leaf[N_NODES];
const int id_coeffs[N_LEAVES];
const int deg[N_LEAVES];
const double coeffs[N_COEFFS];
const double E[2][2];

#endif
