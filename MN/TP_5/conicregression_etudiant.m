clear
close all
% data
m=101;
t=(0:m-1)/10;
x=2*cos(t)+0.2*rand(1,m)-0.1;
y=sin(t)+1+0.2*rand(1,m)-0.1;

% construction de A
A = [x'.^2, (x.*y)', y'.^2, x', y', ones(m, 1)]; 

% calcul de alpha, vecteur des coeff
[U, S, V] = svd(A);
[~, i] = min(abs(diag(S)));
alpha = V(:,i)/V(1, i)


[VV, D] = eig(A'*A);
[~, j] = min(diag(D));
alpha2 = VV(:, j)/VV(1, j)



% tracé
tt=0:0.1:2*pi;
[Xg,Yg]=meshgrid([-2.5:0.01:2.5],[-0.5:0.01:2.5]);
Zg=alpha(1)*Xg.^2+alpha(2)*Xg.*Yg+alpha(3)*Yg.^2+...
    alpha(4)*Xg+alpha(5)*Yg+alpha(6);
plot(x,y,'x',2*cos(tt),sin(tt)+1,'r')
hold on
contour(Xg,Yg,Zg,[0 0],'b')
hold off

