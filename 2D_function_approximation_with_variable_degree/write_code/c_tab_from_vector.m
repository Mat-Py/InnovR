function str = c_tab_from_vector(vector, varargin)
if nargin == 2
    commas = repmat(',\n', [length(vector), 1]);
else
    commas = repmat(', ', [length(vector), 1]);
end
str = num2str(vector');
str = [str, commas]';
str = str(:)';
end

