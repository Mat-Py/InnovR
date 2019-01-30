function [t, u] = shooteuler(f, n, a)
[~, u1] = eulermeth(f, [0, 1], [1; 0.1], n);
[t, u2] = eulermeth(f, [0, 1], [1; 0.2], n);

u1 = u1(1, :);
u2 = u2(1, :);

lambda = (a-u2(n+1))/(u1(n+1) - u2(n+1));

u = lambda * u1 + (1-lambda) * u2;


