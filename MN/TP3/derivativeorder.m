N = 20:10:200;

E = zeros(1, length(N));
E2 = zeros(1, length(N));
for i = 1:length(N)
    [S, E(i)] = splineder(0, 2, @cosh, @sinh, N(i));
    [S, E2(i)] = splineder2(0, 2, @cosh, @cosh, N(i));
end

figure
plot(log(N), log(E));
reg=polyfit(log(N), log(E), 1);
title(reg(1));

figure
plot(log(N), log(E2));
reg=polyfit(log(N), log(E2), 1);
title(reg(1));