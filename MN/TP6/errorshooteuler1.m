n = 4;
[t, y1] = shooteuler('f', n, 2*(1+sin(1)));
t2 = 0:0.001:1;
y2 = t + 2*sin(t)+1;
y22 = t2 + 2*sin(t2)+1;

figure
plot(t, y1, 'x--', t, y2, 'or', t2, y22, 'r');

error = max(abs(y2 - y1))


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

