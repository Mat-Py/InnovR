function c = merge_segments(c1,c2)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
alpha = mean([c1.alpha' ; c2.alpha'])';
E = [min(c1.E(1, 1), c2.E(1, 1)), max(c1.E(1, 2), c2.E(1, 2)) ; 
     min(c1.E(2, 1), c2.E(2, 1)), max(c1.E(2, 2), c2.E(2, 2))];
 
c = struct('E', E, 'alpha', alpha);
end

