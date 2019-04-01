Vth = 30e-3;
mu = 0.0675;
Cox = 1.38e-3;
V0 = 1;
W = 20e-6;
L = 2e-6;

f1 = @(Vgd, Vgs) W.*mu.*Cox./L.*((Vgs-V0).*(Vgs-V0+2.*Vth)-Vth.^2.*(exp(Vgd - V0./Vth)-1));
f = f1;

E = [0 4 ; 0 4];
nb_pts_ls = [100;100];
err_max = 11e-3;
deg_max = 3;
depth_max = 5;
t = get_best_segmentation_degree_tradeoff(f, E, err_max, nb_pts_ls, deg_max, depth_max);


res = [100;100];
figure
subplot(1, 2, 1);
get_surf_from_tree(t, res);
title("best");
ylabel("Vgs");
xlabel("Vgd");
view(3);

subplot(1, 2, 2);
[x, y] = sampling_space(E, res);
[X, Y] = meshgrid(x, y);
F = f(X, Y);
surf(X, Y, F);
ylabel("Vgs");
xlabel("Vgd");
title("original");