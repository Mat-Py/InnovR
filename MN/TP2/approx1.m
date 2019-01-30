n = 4;

J = repmat(0:n, n+1, 1);
I = J';

const = repmat(3/2, n+1);

M = 1./(I+J+const);

