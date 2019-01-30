function [S, E] = splineder(a, b, f, df, n)
h = (b-a)/n;
x = (a:h:b);
y = f(x)';

[A, B] = splinematrices(n);

S = A\((1/h)*B*y);

E = max(abs(df(x)'-S));


