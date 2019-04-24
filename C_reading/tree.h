#ifndef TREE_H
#define TREE_H

#define N_LEAVES 61
#define N_FATHERS 21
#define N_COEFFS 8961
#define N_NODES N_LEAVES + N_FATHERS

const int id_leaf[N_NODES];
const int first_child[N_FATHERS];
const int id_coeffs[N_LEAVES];
const int deg[N_LEAVES];
const double coeffs[N_COEFFS];
const double ES[4*N_LEAVES];
const double E[2][2];

#endif
