function rep = is_point_in_segment(E,x)
rep = 1;
for i=1:length(x)
    if E(i, 1) > x(i) || x(i) > E(i, 2)
        rep = 0;
    end
end