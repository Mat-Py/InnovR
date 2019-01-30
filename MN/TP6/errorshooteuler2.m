arrn = [5, 10, 20, 50, 100, 200];
error = zeros(length(arrn));
for i=1:length(arrn)
    n = arrn(i);
    [t, y1] = shooteuler('f', n, 2*(1+sin(1)));
    y2 = t + 2*sin(t)+1;
    error(i) = max(abs(y2 - y1));
end

figure
plot(log(arrn), log(error));
