function t = merge_segments(t)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
%Operate only for nodes where all children are leaves

if t.isleaf(1)
    return
end

nonleaves = sum(arrayfun(@(c) 1- t.isleaf(c), t.getchildren(1)));

if nonleaves > 0
    for c=t.getchildren(t, 1)
        st = merge_segments(t);
        t = t.chop(c);
        t = t.graft(st);
    end
else
    for c1=t.getchildren(t, 1)
        for c2=t.getchildren(t, 1)
            if 1 % todo
            end
        end
    end
end

