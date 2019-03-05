close all;

f = @(x, y) abs(x);
% f = @peaks;
E = [-3 3 ; -3 3];
nb_pts_ls = [50;50];
err_max = 0.01;
deg_max = 10;
depth_max = 5;
t_sufficient = get_sufficient_nonuniform_segmentation(f, E, err_max, nb_pts_ls, deg_max);
t_best = get_best_segmentation_degree_tradeoff(f, E, err_max, nb_pts_ls, deg_max, depth_max);
disp(t.tostring);

t_sufficient
t_best

t = t_best;

res = [100;100];
figure
subplot(2, 2, 1);
get_surf_from_tree(t_best, res);
title("best");
view(3);

subplot(2, 2, 3);
get_surf_from_tree(t_sufficient, res);
title("sufficient");
view(3);

subplot(2, 2, 2);
[x, y] = sampling_space(E, res);
[X, Y] = meshgrid(x, y);
F = f(X, Y);
surf(X, Y, F);
title("original");

costs_best = costs_of_tree(t_best)
costs_sufficient = costs_of_tree(t_sufficient)



