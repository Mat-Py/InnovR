function [D2, E] = splineder2(a, b, f, d2f, n)
h = (b-a)/n;
x = (a:h:b);
y = f(x)';
[A, B] = splinematrices(n);

S = A\((1/h)*B*y);
D2 = A\((1/h)*B*S);

E = max(abs(d2f(x)'-D2));
