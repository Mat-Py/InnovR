function alpha = polynomial_least_squares(f, x, y, degree)
%POLYNOMIAL_LEAST_SQUARES Summary of this function goes here
%   Detailed explanation goes here

comb = (combvec(x', y'))';
cx = comb(:,1);
cy = comb(:,2);

A = monomials2D(cx, cy, degree);
b = f(cx, cy);

alpha = (A'*A) \ (A'*b);
end

