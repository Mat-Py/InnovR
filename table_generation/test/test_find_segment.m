close all;

% f = @(x, y) abs(x);
f = @peaks;
% f = @funct;
E = [-3 3 ; -3 3];
nb_pts_ls = [50;50];
err_max = 0.01;
deg_max = 3;
depth_max = 5;
t_best = get_best_segmentation_degree_tradeoff(f, E, err_max, nb_pts_ls, deg_max, depth_max);

pt = [1, 1];
t_seg = find_segment_from_point(t_best, pt);

res = [100,100];
figure
get_surf_from_tree(t_best, res);
hold on;
plot3(pt(1), pt(2), apply_poly_function(pt(1), pt(2), t_seg.get(1).alpha), "r*");
hold off;
view(3);
