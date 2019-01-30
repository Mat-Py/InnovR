function d=gol2(nl, nr, n)
A = gol1(nl, nr, n);
d=(A*inv(A'*A))*[1, zeros(1, n-1)]';