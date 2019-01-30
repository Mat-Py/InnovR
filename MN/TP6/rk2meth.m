function [t, u] = rk2meth(f, interv, eta, n)
u = zeros(2, n+1);
h = (interv(2)-interv(1))/n;
t = interv(1):h:interv(2);
u(:, 1) = eta;

for i=1:n
    u(:, i+1) = u(:, i) + h*feval(f, t(i)+h/2, u(:, i)+h/2*feval(t(i), u(:,i)));
end
    