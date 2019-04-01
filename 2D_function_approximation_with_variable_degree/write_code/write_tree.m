function write_tree(t)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
model = fileread('tree.c.mo');

n_leaves = 0;
n_fathers = 1;
tab_id_leaf = '';
for node=1:t.nnodes
    if t.isleaf(node)
        tab_id_leaf = [tab_id_leaf, num2str(n_leaves), ', '];
        n_leaves = n_leaves + 1;
    else
        tab_id_leaf = [tab_id_leaf, num2str(-n_fathers), ', '];
        n_fathers = n_fathers + 1;
    end
end
model = strrep(model, '/*ID_LEAF*/', tab_id_leaf);

f = fopen('../write_code/tree.c', 'w');
fwrite(f, model);
fclose(f);
end

