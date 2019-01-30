function Yp = f(t, Y)
Yp = [Y(2) ; 1-2*t*cos(t) - Y(1) + t*Y(2)];