function t = get_best_segmentation_degree_tradeoff_with_merge(f, E, err_max, res, deg_max, depth_max)
%GET_BEST_SEGMENTATION_DEGREE_TRADEOFF Summary of this function goes here
%   Detailed explanation goes here

[alpha, err] = get_sufficient_degree(f, E, err_max, res, deg_max);
results = struct('E', E, 'alpha', alpha);
t = tree(results);


if depth_max >= 1
    if err > err_max
        subres = round(res ./ 2);
        subEs = split_space_in_four(E);
        for i=1:4
            subE = reshape(subEs(i,:), 2, [])';
            subt = get_best_segmentation_degree_tradeoff(f, subE, err_max, subres, deg_max, depth_max-1);
            t = t.graft(1, subt);
        end
        
    else
        costs_seg = 0;
        subres = round(res ./ 2);
        subEs = split_space_in_four(E);
        for i=1:4
            subE = reshape(subEs(i,:), 2, [])';
            subt(i) = get_best_segmentation_degree_tradeoff(f, subE, err_max, subres, deg_max, depth_max-1);
            costs_seg = costs_seg + costs_of_tree(subt(i));
        end
        if costs_seg < costs_of_tree(t)
            for i=1:4
                t = t.graft(1, subt(i));
            end
        end
    end
    
    to_add = [];
    to_remove = [];
    children = t.getchildren(1);
    for i1=1:length(children)
        c1 = children(i1);
        for i2=(i1+1):length(children)
            c2 = children(i2);
            if t.isleaf(c1) && t.isleaf(c2)
                s1 = t.get(c1);
                s2 = t.get(c2);
                if are_segments_mergeable(s1, s2)
                    s = merge_segments(s1, s2);
                    err = get_mean_square_error(f, s.alpha, s.E, res);
                    if err <= err_max
                        to_remove = [to_remove, c1, c2];
                        disp("On fusionne : ")
                        s1.E
                        s2.E
                        to_add = [to_add, s];
                        disp("En : ")
                        s.E
                    end
                end
            end
        end
    end
    
    to_remove = sort(to_remove, 'descend');
    for i=to_remove
        t = t.removenode(i);
    end
    for i=to_add
        t = t.addnode(1, i);
    end
    
end



