function t = get_best_segmentation_degree_tradeoff(f, E, err_max, res, deg_max, depth_max)
%GET_BEST_SEGMENTATION_DEGREE_TRADEOFF Summary of this function goes here
%   Detailed explanation goes here

[alpha, err] = get_sufficient_degree(f, E, err_max, res, deg_max);
results = struct('E', E, 'alpha', alpha);
t = tree(results);

if err > err_max && depth_max >= 1
    subres = round(res ./ 2);
    subEs = split_space_in_four(E);
    for i=1:4
        subE = reshape(subEs(i,:), 2, [])';
        subtree = get_best_segmentation_degree_tradeoff(f, subE, err_max, subres, deg_max, depth_max-1);
        t = t.graft(1, subtree);
    end
    
elseif depth_max >= 1
    costs_seg = 0;
    subres = round(res ./ 2);
    subEs = split_space_in_four(E);
    for i=1:4
        subE = reshape(subEs(i,:), 2, [])';
        subtree(i) = get_best_segmentation_degree_tradeoff(f, subE, err_max, subres, deg_max, depth_max-1);
        costs_seg = costs_seg + costs_of_tree(subtree(i));
    end
    if costs_seg < costs_of_tree(t)
        for i=1:4
            t = t.graft(1, subtree(i));
        end
    end
end

