clear all;
close all;

% Calculation of least square coefficients
degree = 10;

E = [-3 3 ; -3 3];

n_pts = [20 ; 20];
dx = E(1, 2) - E(1, 1);
hx = dx/n_pts(1);
x = (E(1, 1):hx:E(1, 2)-hx)';
dy = E(1, 2) - E(1, 1);
hy = dy/n_pts(1);
y = (E(1, 1):hy:E(1, 2)-hy)';

% f = @(x, y) x.^2+y + x.*y+5;
f = @peaks;
alpha = polynomial_least_squares(f, x, y, degree);
alpha

% Display results
res = [100 ; 100];

dx_d = E(1, 2) - E(1, 1);
hx_d = dx_d/res(1);
x_d = (E(1, 1):hx_d:E(1, 2)-hx_d)';
dy_d = E(1, 2) - E(1, 1);
hy_d = dy_d/res(1);
y_d = (E(1, 1):hy_d:E(1, 2)-hy_d)';

comb = (combvec(x_d', y_d'))';
cx_d = comb(:,1);
cy_d = comb(:,2);


%Original function
[X, Y] = meshgrid(x_d, y_d);
F = f(X, Y);

figure
surf(X, Y, F);


%approximated function 
monomials = sum(alpha' .* monomials2D(cx_d, cy_d, degree), 2);
f_app = reshape(monomials, res(1), res(2))';

figure
surf(X, Y, f_app);
