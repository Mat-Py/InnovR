function write_tree(t)
n_leaves = 0;
n_fathers = 1;
id_leaf = [];
first_child = [0];
coeffs = [];
id_coeffs = [0];
deg = [];
E = [];

disp("FLATTEN TREE");
for node=t.breadthfirstiterator
    if t.isleaf(node) 
        E = [E, t.get(node).E(1, :), t.get(node).E(2, :)];
        id_leaf = [id_leaf, n_leaves];
        n_leaves = n_leaves + 1;
        coeffs = [coeffs , t.get(node).alpha'];
        id_coeffs = [id_coeffs, id_coeffs(end) + numel(t.get(node).alpha)];
        deg = [deg, get_deg_from_n(numel(t.get(node).alpha))];
    else
        id_leaf = [id_leaf, -n_fathers];
        n_fathers = n_fathers + 1;
        children = t.getchildren(node);
        first_child = [first_child, find(~(t.breadthfirstiterator - children(1))) - 1];
    end
end

disp('TREE.C');
model = fileread('tree.c.mo');

int_f = '%d, ';
float_f = '%10.5f,\n';
model = strrep(model, '/*ID_LEAF*/', num2str(id_leaf, int_f));
model = strrep(model, '/*FIRST_CHILD*/', num2str(first_child, int_f));
model = strrep(model, '/*DEG*/', num2str(deg, int_f));
model = strrep(model, '/*ID_COEFFS_ARRAY*/', num2str(id_coeffs(1:end-1), int_f));
model = strrep(model, '/*COEFFS*/', num2str(coeffs, float_f));
model = strrep(model, '/*ES*/', num2str(E, float_f));
E = t.get(1).E;
E_str = ['{', num2str(E(1, 1), float_f), num2str(E(1, 2), float_f), '},{',num2str(E(2, 1), float_f), num2str(E(2, 2), float_f), '}'];
model = strrep(model, '/*E*/', E_str);


f = fopen('../C_reading/tree.c', 'w');
fprintf(f, model);
fclose(f);

disp('TREE.H');
model = fileread('tree.h.mo');

model = strrep(model, '/*N_LEAVES*/', num2str(n_leaves));
model = strrep(model, '/*N_FATHERS*/', num2str(n_fathers));
model = strrep(model, '/*N_COEFFS*/', num2str(sum(id_coeffs)));
model = strrep(model, '/*MAX_DEGREE*/', num2str(max(deg)));

f = fopen('../C_reading/tree.h', 'w');
fprintf(f, model);
fclose(f);


end

