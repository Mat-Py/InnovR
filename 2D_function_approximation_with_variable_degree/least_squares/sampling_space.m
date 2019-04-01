function [x,y] = sampling_space(E,res)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
dx = E(1, 2) - E(1, 1);
hx = dx/res(1);
x = (E(1, 1):hx:E(1, 2)-hx)';
dy = E(2, 2) - E(2, 1);
hy = dy/res(1);
y = (E(2, 1):hy:E(2, 2)-hy)';
end

