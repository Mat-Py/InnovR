function A=tridiag(u, v, w, n)
u = ones(n-1, 1)*u;
v = ones(n, 1)*v;
w = ones(n-1, 1)*w;
A = diag(u, -1) + diag(v) + diag(w, 1);