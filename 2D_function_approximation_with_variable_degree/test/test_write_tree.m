close all;
clear all;

% f = @(x, y) abs(x);
f = @peaks;
% f = @funct;
E = [-3 3 ; -3 3];
nb_pts_ls = [50;50];
err_max = 0.0001;
deg_max = 3;
depth_max = 6;
t = get_best_segmentation_degree_tradeoff(f, E, err_max, nb_pts_ls, deg_max, depth_max);
write_tree(t);


res = [100;100];
figure
get_surf_from_tree(t, res);