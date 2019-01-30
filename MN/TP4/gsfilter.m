clear all;
close all;

nr = 30;
nl = 30;
n = 3;
p = 1000;

c = gol2(nr,nl,n);

[x, y, yn] = signal2(p);

ys = zeros(1, p);
for i=nl+1:p-nr
    ys(i) = yn(i-nl:i+nr)*c;
end;

figure
plot(x, y, x, ys);
figure
plot(x, yn);