clear all;
close all;

x = 0:0.001:1;

n = 20;
J = repmat(0:n, n+1, 1);
I = J';
const = repmat(3/2, n+1);

M = 1./(I+J+const);
cond(M)
b = sndpart('f1', n)';
a = fliplr((M\b)');

y = polyval(a, x);v 
y2 = f1(x);

figure
plot(x, y, x, y2);