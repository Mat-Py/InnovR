close all;

f = @peaks;
E = [-3 3 ; -3 3];
res = [50;50];
err_max = 0.001;
deg_max = 4;
t = get_sufficient_nonuniform_segmentation(f, E, err_max, res, deg_max);
disp(t.tostring);

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

costs = costs_of_tree(t)

