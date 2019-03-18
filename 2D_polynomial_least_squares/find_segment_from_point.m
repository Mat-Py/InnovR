function t_right = find_segment_from_point(t, x)
if t.isleaf(1)
    t_right = t;
    return
end

for child=t.getchildren(1)
    t_child = t.subtree(child);
    if is_point_in_segment(t_child.get(1).E, x)
        t_right = find_segment_from_point(t_child, x);
        return
    end
end
