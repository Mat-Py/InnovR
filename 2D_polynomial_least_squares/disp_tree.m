function disp_tree(t)

for node=1:t.nnodes()
    t = t.set(node, [t.get(node).E(1), t.get(node).E(2)]);
end

disp(t.tostring);

