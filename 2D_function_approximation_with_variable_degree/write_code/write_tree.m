function write_tree(t)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
model = fileread('tree.c.mo');

n_leaves = 0;
n_fathers = 1;
id_leaf = [];
f_son = [];
coeffs = [];
n_coeffs_array = [];
for node=1:t.nnodes
    if t.isleaf(node)
        id_leaf = [id_leaf, n_leaves];
        n_leaves = n_leaves + 1;
        coeffs = [coeffs , t.get(node).alpha'];
        n_coeffs_array = [n_coeffs_array, numel(t.get(node).alpha)];
    else
        id_leaf = [id_leaf, -n_fathers];
        n_fathers = n_fathers + 1;
        children = t.getchildren(node);
        f_son = [f_son, children(1)-1];
    end
end

model = strrep(model, '/*ID_LEAF*/', c_tab_from_vector(id_leaf));
model = strrep(model, '/*F_SON*/', c_tab_from_vector(f_son));
model = strrep(model, '/*N_COEFFS_ARRAY*/', c_tab_from_vector(n_coeffs_array));
model = strrep(model, '/*COEFFS*/', c_tab_from_vector(coeffs));



model = strrep(model, '/*N_LEAVES*/', num2str(n_leaves));
model = strrep(model, '/*N_FATHERS*/', num2str(n_fathers));
model = strrep(model, '/*N_COEFFS*/', num2str(numel(n_coeffs_array)));


f = fopen('write_code/tree.c', 'w')
fwrite(f, model);
fclose(f);
end

