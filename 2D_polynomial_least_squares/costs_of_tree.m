function [mem, mul, comp, add] = costs_of_tree(t)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
mem = length(t.get(1).alpha);
mul = 0;
comp = 0;
add = 0;
for child=t.getchildren(1)
    [mem_, mul, comp, add] = costs_of_tree(t.subtree(child));
    mem = mem + mem_;
end

