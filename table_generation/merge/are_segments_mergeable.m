function rep = are_segments_mergeable(s1,s2)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
rep = length(s1.alpha) == length(s2.alpha) && are_segments_adjacent(s1.E, s2.E);
end

