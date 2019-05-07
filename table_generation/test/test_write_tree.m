close all;

% f = @(x, y) abs(x);
f = @atan2;
% f = @peaks;
% f = @funct;
E = [-2.1 3 ; -2.1 3];
nb_pts_ls = [1000;1000];
err_max = 0.001;
deg_max = 3;
depth_max = 5;
t = get_best_segmentation_degree_tradeoff(f, E, err_max, nb_pts_ls, deg_max, depth_max);
write_tree(t, E);

res = [1000;1000];
figure
ax1 = subplot(1, 2, 1);
get_surf_from_tree(t, res);
title("approximate");
colormap(ax1,spring)
view(3);

ax2 = subplot(1, 2, 2);
[x, y] = sampling_space(E, res);
[X, Y] = meshgrid(x, y);
F = f(X, Y);
surf(X, Y, F,  'EdgeColor','None', 'facecolor', 'interp');
colormap(ax2,spring)
title("original");


