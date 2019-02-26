function t = get_sufficient_nonuniform_segmentation(f, E, err_max, res, deg_max)
%GET_SUFFICIENT_UNIFORM_SEGMENTATION Summary of this function goes here
%   Detailed explanation goes here
[deg, alpha, err] = get_sufficient_degree(f, E, err_max, res, deg_max);
t = tree(alpha);
child = 1;
if err > err_max
    subres = res%round(res ./ 2);
    x_min = E(1, 1);
    x_max = E(1, 2);
    for x=round(x_min:(x_min-x_max)/2:x_max)
        y_min = E(1, 1);
        y_max = E(1, 2);
        for y=round(y_min:(y_min-y_max)/2:y_max)
            subE = [x_min, x_max ; y_min, y_max]
            subtree = get_sufficient_nonuniform_segmentation(f, subE, err_max, subres, deg_max);
            t = t.graft(child, subtree);
            child = child + 1;
        end
    end
end

