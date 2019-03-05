close all;

cost = 1000;
last_cost = cost +1;
f = @peaks;

E = [-2 3 ; -2 3];
res = [50;50];
err_max = 0.01;
deg_max = 0;
while cost < last_cost
    last_cost = cost;
    deg_max = deg_max +1;
    t = get_sufficient_nonuniform_segmentation(f, E, err_max, res, deg_max);
    cost = costs_of_tree(t);
end

res = [200;200];
figure
subplot(1, 2, 1);
get_surf_from_tree(t, res);
title("approx");
view(3);

subplot(1, 2, 2);
[x, y] = sampling_space(E, res);
[X, Y] = meshgrid(x, y);
F = f(X, Y);
surf(X, Y, F);
title("original");
