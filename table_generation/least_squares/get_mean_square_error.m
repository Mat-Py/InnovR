function err = get_mean_square_error(f, alpha, E, res)
% Return mean square error between f and the polynomial function defined by 
% alpha for all points in E according to given resolution res

deg = get_deg_from_n(length(alpha));
[x, y] = sampling_space(E, res);

%Original function
[X, Y] = meshgrid(x, y);
F = f(X, Y);

%approximated function 
[f_app, ~, ~] = apply_poly_function(x, y, alpha);

err = mean2((f_app - F).^2);


