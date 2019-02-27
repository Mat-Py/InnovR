function get_surf_from_tree(t)
leaves = findleaves(t);
res = [100, 100];
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
    
    comb = (combvec(x', y'))';
    cx_d = comb(:,1);
    cy_d = comb(:,2);
    deg = get_deg_from_n(length(content.alpha));
    f_app_v = sum(content.alpha' .* monomials2D(cx_d, cy_d, deg), 2);
    f_app = reshape(f_app_v, subres(1), subres(2))';
    surf(X, Y, f_app);
end
hold off;

