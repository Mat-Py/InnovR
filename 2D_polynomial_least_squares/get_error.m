function err = get_error(f, alpha, E, res)
% Return mean square error between f and the polynomial function defined by 
% alpha for all points in E according to given resolution res

deg = get_deg_from_n(length(alpha));
[x, y] = sampling_space(E, res);

%Original function
[X, Y] = meshgrid(x, y);
F = f(X, Y);

%approximated function 

comb = (combvec(x', y'))';
cx = comb(:,1);
cy = comb(:,2);

monomials = sum(alpha' .* monomials2D(cx, cy, deg), 2);
f_app = reshape(monomials, res(1), res(2))';

err = mean2((f_app - F).^2);


