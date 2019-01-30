clear all;
close all;
a = 0;
b = 1;
p = 4;
for i=1:p+1
    T(i) = trap(a, b, 'f', 2^(i-1));
end
T