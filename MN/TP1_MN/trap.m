function y=trap(a, b, filef, n)
h = (b-a)/n;
x = a+h:h:b-h;
fx = feval(filef, x);
y = h/2 *( feval(filef, a) + feval(filef, b) +2*sum(fx)); 