function [alpha, err] = get_sufficient_degree(f, E, err_max, res, degree_max)

[x, y] = sampling_space(E, res);
err = err_max +1;
degree = 0;
while err > err_max && degree <= degree_max
    alpha = polynomial_least_squares(f, x, y, degree);
    err = get_error(f, alpha, E, res);
    degree = degree +1;
end
