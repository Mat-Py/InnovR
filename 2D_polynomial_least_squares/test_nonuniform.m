f = @peaks;
E = [-3 3 ; -3 3];
err_max = 0.01;
deg_max = 4;
t = get_sufficient_nonuniform_segmentation(f, E, err_max, res, deg_max);
disp(t.tostring);