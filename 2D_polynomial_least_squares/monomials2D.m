function v = monomials2D(x,y, degree)
%2D_MONOMS Summary of this function goes here
%   Detailed explanation goes here

v = [ones(length(x), 1), x, y];
id = 4;
for depth=3:degree+1
    for node=1:depth
        if node==1
            v = [v, v(:,2) .* v(:,id-depth+1)];
        else
            v = [v, v(:,3) .* v(:,id-depth)];
        end
        id = id+1;
    end
end

