function [F,X,Y] = apply_poly_function(x, y, alpha)
comb = (combvec(x', y'))';
cx_d = comb(:,1);
cy_d = comb(:,2);
[X, Y] = meshgrid(x, y);
deg = get_deg_from_n(length(alpha));
F_v = sum(alpha' .* monomials2D(cx_d, cy_d, deg), 2);
F = reshape(F_v, length(x), length(y))';
end

