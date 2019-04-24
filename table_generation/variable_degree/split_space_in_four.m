function subEs = split_space_in_four(E)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
x_min = E(1, 1);
x_max = E(1, 2);
x_h = (x_max-x_min)/2;
x = [(x_min:x_h:x_max-x_h)' , (x_min+x_h:x_h:x_max)'];
y_min = E(2, 1);
y_max = E(2, 2);
y_h = (y_max-y_min)/2;
y = [(y_min:y_h:y_max-y_h)' , (y_min+y_h:y_h:y_max)'];
subEs = combvec(x, y)';
end

