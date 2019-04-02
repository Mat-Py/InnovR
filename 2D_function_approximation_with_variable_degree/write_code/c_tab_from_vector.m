function str = c_tab_from_vector(vector)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
str = num2str(vector');
commas = repmat(', ', [length(vector), 1]);
str = [str, commas]';
str = str(:)';
str = str(1:end-2);
end

