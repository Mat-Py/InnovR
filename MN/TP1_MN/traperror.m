arrn=[1, 2, 5, 7, 10, 15, 20, 35, 50, 75, 100];
s = size(arrn);
N = s(2);
arrerr=zeros(1, N);
I = integral(@(x) exp(x), 0, 1);
for i=1:N
    arrerr(i) = abs(I- trap(0, 1, 'f', arrn(i)));
end

figure
plot(log(arrn), log(arrerr));
title('Error of Trap method on exp function');
polyfit(log(arrn), log(arrerr), 1)
plottools;