function b=sndpart(namefunc, n)
    b = zeros(1, n+1);
    for i=1:n+1
       b(i) = quadl('functj', 0, 1, [ ], [ ], namefunc, i-1);
    end;