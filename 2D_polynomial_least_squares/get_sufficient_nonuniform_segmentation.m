function t = get_sufficient_nonuniform_segmentation(f, E, err_max, res, deg_max)
[alpha, err] = get_sufficient_degree(f, E, err_max, res, deg_max);
results = struct('E', E, 'alpha', alpha);
t = tree(results);
if err > err_max
    subres = round(res ./ 2);
    subEs = split_space_in_four(E);
    for i=1:4
        subE = reshape(subEs(i,:), 2, [])';
        subtree = get_sufficient_nonuniform_segmentation(f, subE, err_max, subres, deg_max);
        t = t.graft(1, subtree);
    end
end


