#ifndef TREE_H
#define TREE_H

#define N_LEAVES /*N_LEAVES*/
#define N_FATHERS /*N_FATHERS*/
#define N_COEFFS /*N_COEFFS*/
#define N_NODES N_LEAVES + N_FATHERS

const int id_leaf[N_NODES];
const int first_child[N_FATHERS];
const int id_coeffs[N_LEAVES];
const int deg[N_LEAVES];
const double coeffs[N_COEFFS];
const double E[2][2];

#endif
