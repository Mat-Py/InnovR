close all;

f = @peaks;
f = @atan2
E = [-3 3 ; -3 3];
res = [100;100];
err_max = 0.0005;
deg_max = 5;
t = get_sufficient_nonuniform_segmentation(f, E, err_max, res, deg_max);
disp(t.tostring);

res = [500;500];
figure
% subplot(1, 2, 1);
get_surf_from_tree(t, res);
map = [0, 0, 0.5];
colormap(map)
title("atan2");
view(3);
% 
% subplot(1, 2, 2);
% [x, y] = sampling_space(E, res);
% [X, Y] = meshgrid(x, y);
% F = f(X, Y);
% surf(X, Y, F);
% title("original");
% 
% costs = costs_of_tree(t)

