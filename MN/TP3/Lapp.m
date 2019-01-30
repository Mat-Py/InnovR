function [L, E] = Lapp(a, b, f, intrule, n, l)
[S, q] = splineder(a, b, f, f, n+1);
L = intrule(S, (b-a)/(n-1));
E = abs(l-L);