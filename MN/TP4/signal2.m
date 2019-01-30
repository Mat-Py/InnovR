function [x, y, yn] = signal2(n)
[x, y] = signal1(n);

yn = y + 10/100 * (rand(1, n) * 2 -1);