clear all;
close all;

% Calculation of least square coefficients
E = [-3 3 ; -3 3];
err_max = 0.01;
err = 100;
deg_max = 15;

% f = @(x, y) x.^2+y + x.*y+5;
f = @peaks;
res = [100;100];
[deg, alpha, err] = get_sufficient_degree(f, E, err_max, res, deg_max);

dx_d = E(1, 2) - E(1, 1);
hx_d = dx_d/res(1);
x_d = (E(1, 1):hx_d:E(1, 2)-hx_d)';
dy_d = E(1, 2) - E(1, 1);
hy_d = dy_d/res(1);
y_d = (E(1, 1):hy_d:E(1, 2)-hy_d)';
%Original function
[X, Y] = meshgrid(x_d, y_d);
F = f(X, Y);
%Approximation
comb = (combvec(x_d', y_d'))';
cx_d = comb(:,1);
cy_d = comb(:,2);
monomials = sum(alpha' .* monomials2D(cx_d, cy_d, deg), 2);
f_app = reshape(monomials, res(1), res(2))';

figure
subplot(1, 2, 1);
surf(X, Y, F);
title("original");
subplot(1, 2, 2);
surf(X, Y, f_app);
title("approximation degré " + deg);

