function S=simsum(z, h)
n = length(z)-1;
S = h/3*(z(1)+z(n+1)+ 2*sum(z(3:2:n-1)) + 4*sum(z(2:2:n)));
