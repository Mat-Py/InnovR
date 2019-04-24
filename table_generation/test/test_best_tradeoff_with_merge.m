close all;

% f = @(x, y) abs(x);
f = @peaks;
% f = @funct;
E = [-3 3 ; -3 5];
nb_pts_ls = [50;50];
err_max = 0.01;
deg_max = 10;
depth_max = 5;
t_best = get_best_segmentation_degree_tradeoff(f, E, err_max, nb_pts_ls, deg_max, depth_max);
t_best_merge = get_best_segmentation_degree_tradeoff_with_merge(f, E, err_max, nb_pts_ls, deg_max, depth_max);

disp("t_best");
disp(t_best.tostring);
disp("t_best_merge");
disp(t_best_merge.tostring);

res = [100;100];
figure
subplot(2, 2, 1);
get_surf_from_tree(t_best, res);
title("best");
view(3);

subplot(2, 2, 3);
get_surf_from_tree(t_best_merge, res);
title("merge");
view(3);

subplot(2, 2, 2);
[x, y] = sampling_space(E, res);
[X, Y] = meshgrid(x, y);
F = f(X, Y);
surf(X, Y, F,  'EdgeColor','None', 'facecolor', 'interp');
title("original");

costs_best = costs_of_tree(t_best)
costs_best_merge = costs_of_tree(t_best_merge)



