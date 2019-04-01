function write_tree(t)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
model = fileread('tree.c.mo')

model = strrep(model, '/*ID_LEAF*/', "test");

f = fopen('tree.c', 'w');
fwrite(f, model);
fclose(f);
end

