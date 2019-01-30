function inteq1()
a = -1;
b = 1;
n = 3;
h = (b-a)/n;
xi = @(i) a+(i-1)*h; 
i = 1:n+1;
lines = (xi(i))';
lines = repmat(lines, 1, n+1);
columns = (xi(i));
columns = repmat(columns, n+1, 1);
Bn=lines-columns

