function get_surf_from_tree(t, res)
leaves = findleaves(t);
E = t.get(1).E;
dx = E(1, 2) - E(1, 1);
dy = E(2, 2) - E(2, 1);

hold on;
for leaf=leaves
    content = t.get(leaf);
    subE = content.E;
    
    % normalisation of resolution
    subdx = subE(1, 2) - subE(1, 1);
    subdy = subE(2, 2) - subE(2, 1);
    subres = round(res .* [subdx, subdy] ./ [dx, dy]);
    
    [x, y] = sampling_space(subE, subres);
    [X, Y] = meshgrid(x, y);
    
    [f_app, ~, ~] = apply_poly_function(x, y, content.alpha);
    surf(X, Y, f_app, 'EdgeColor','None', 'facecolor', 'interp');
end
hold off;
view(3);

