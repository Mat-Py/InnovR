function err = get_error(f, E, res, alpha)
%GET_ERROR Summary of this function goes here
%   Detailed explanation goes here
% Display results    
dx_d = E(1, 2) - E(1, 1);
hx_d = dx_d/res(1);
x_d = (E(1, 1):hx_d:E(1, 2)-hx_d)';
dy_d = E(1, 2) - E(1, 1);
hy_d = dy_d/res(1);
y_d = (E(1, 1):hy_d:E(1, 2)-hy_d)';

deg = (-1 + sqrt(1+8*(length(alpha)-1))) / 2;

comb = (combvec(x_d', y_d'))';
cx_d = comb(:,1);
cy_d = comb(:,2);

%Original function
[X, Y] = meshgrid(x_d, y_d);
F = f(X, Y);


%approximated function 
monomials = sum(alpha' .* monomials2D(cx_d, cy_d, deg), 2);
f_app = reshape(monomials, res(1), res(2))';

err = mean2((f_app - F).^2);
end

