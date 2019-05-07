#ifndef TREE_H
#define TREE_H

#define N_LEAVES 742
#define N_FATHERS 248
#define N_COEFFS 798289
#define N_NODES N_LEAVES + N_FATHERS
#define MAX_DEGREE 1
#define NB_BITS (unsigned int)1.585

const int id_leaf[N_NODES];
const int id_coeffs[N_LEAVES];
const int deg[N_LEAVES];
const double coeffs[N_COEFFS];
const double E[2][2];

#endif
