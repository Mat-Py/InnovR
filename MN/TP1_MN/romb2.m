clear all;
close all;
a = 0;
b = 1;
p = 4;
T = zeros(p+1);
for i=1:p+1
    T(1, i) = trap(a, b, 'f', 2^(i-1));
end

for i=2:p+1
    for j=1:p+1
        T(i, j) = ((4^j)*T(1, 2)-T(1, 1))/(4^j - 1);
    end
end
T