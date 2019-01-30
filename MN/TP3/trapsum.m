function T=trapsum(z, h)
n = length(z)-1;
T = h/2*(z(1)+z(n+1)+2*sum(z(2:n)));