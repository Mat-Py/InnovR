function V = vdm(x, n)
V = repmat(x', 1, n);
J = 0:n-1;
for i=1:size(x')
    V(i, :) = V(i, :).^J;
end;