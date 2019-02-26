function [deg, alpha, err] = get_sufficient_degree(f, E, err_max, res, degree_max)

dx = E(1, 2) - E(1, 1);
hx = dx/res(1);
x = (E(1, 1):hx:E(1, 2)-hx)';
dy = E(1, 2) - E(1, 1);
hy = dy/res(1);
y = (E(1, 1):hy:E(1, 2)-hy)';

err = err_max +1;
degree = 0;
while err > err_max && degree <= degree_max
    alpha = polynomial_least_squares(f, x, y, degree);
    err = get_error(f, E, res, alpha);
    degree = degree +1;
end

if degree == degree_max
    deg = 0;
else
    deg = degree-1;
end
