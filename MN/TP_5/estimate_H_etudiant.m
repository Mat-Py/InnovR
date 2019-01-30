function [H] = estimate_H_etudiant(x1,x2)
% ESTIMATE_H -
%
%   Input : pairs of correspondent points :
%   N : number of points
%   x1 : 2xN set of 2D points in the 1st image 
%   x2 : 2xN set of 2D points in the 2nd image 
%   x1(:,i) and x2 (:,i) are matched together
%
%   Ouput : 
%   H : 3x3 matrix, the homography from image 1 to image 2

%Number of points
[dim,N] = size(x1);
%if(N < 4)
% error ('Need at least 4 pairs of points !')
%end

%Homogeneous coordinates
xh1 = x1;
xh2 = x2;
if(dim == 2)
    hhh  = ones(1,N);
    xh1 = [xh1;hhh];
    xh2 = [xh2;hhh];
end

%Fill A of min ||Ax||
A = [];
for i = 1:N
    p1 = xh1(:, i);
    p2 = xh2(:, i);
    A= [A 
        0, 0, 0,         -p2(3)*p1',   p2(2)*p1'  
        -p1(3)*p2', 0, 0, 0,          -p2(1)*p1' 
        p1(2)*p2',  -p1(1)*p2',  0, 0, 0        ];
end

% to complete

[~,s,v] = svd(A, 0); 
%singular value are sorted 
h = v(:,9);

H = reshape(h,3,3)';
%H= eye(3);

