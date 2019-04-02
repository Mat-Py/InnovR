close all;

% f = @(x, y) abs(x);
f = @peaks;
% f = @funct;
E = [-5 5 ; -3 3];
nb_pts_ls = [50;50];
err_max = 0.01;
deg_max = 4;
depth_max = 5;
t = get_best_segmentation_degree_tradeoff(f, E, err_max, nb_pts_ls, deg_max, depth_max);
disp(t.tostring);

res = [100;100];
figure
get_surf_from_tree(t, res);

write_tree(t);