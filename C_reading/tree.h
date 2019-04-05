#ifndef TREE_H
#define TREE_H

#define N_LEAVES 7
#define N_FATHERS 3
#define N_COEFFS 762
#define N_NODES N_LEAVES + N_FATHERS

const int id_leaf[N_NODES];
const int f_son[N_FATHERS];
const int id_coeffs[N_LEAVES];
const int deg[N_LEAVES];
const double coeffs[N_COEFFS];
const double E[2][2];

#endif