function [A, B] = splinematrices(n)
A = tridiag(1, 4, 1, n+1);
A(1, 1) = 1;
A(1, 2) = 0;
A(1, 3) = -1;
A(n+1, n+1) = -1;
A(n+1, n) = 0;
A(n+1, n-1) = 1;

B = tridiag(-3, 0, 3, n+1);
B(1, 1) = -2;
B(1, 2) = 4;
B(1, 3) = -2;
B(n+1, n+1) = -2;
B(n+1, n) = 4;
B(n+1, n-1) = -2;