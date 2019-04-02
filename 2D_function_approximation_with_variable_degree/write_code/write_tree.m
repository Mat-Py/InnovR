function write_tree(t)
n_leaves = 0;
n_fathers = 1;
id_leaf = [];
f_son = [0];
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

model = fileread('tree.c.mo');

int_f = '%d, ';
float_f = '%10.5f,\n';
model = strrep(model, '/*ID_LEAF*/', num2str(id_leaf, int_f));
model = strrep(model, '/*F_SON*/', num2str(f_son, int_f));
model = strrep(model, '/*N_COEFFS_ARRAY*/', num2str(n_coeffs_array, int_f));
model = strrep(model, '/*COEFFS*/', num2str(coeffs, float_f));

f = fopen('../C_reading/tree.c', 'w');
fprintf(f, model);
fclose(f);


model = fileread('tree.h.mo');

model = strrep(model, '/*N_LEAVES*/', num2str(n_leaves));
model = strrep(model, '/*N_FATHERS*/', num2str(n_fathers));
model = strrep(model, '/*N_COEFFS*/', num2str(sum(n_coeffs_array)));

f = fopen('../C_reading/tree.h', 'w');
fprintf(f, model);
fclose(f);


end

