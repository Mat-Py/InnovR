function y=functj(x, namefunc, j)
    y = feval(namefunc, x).*x.^(j+1/2);