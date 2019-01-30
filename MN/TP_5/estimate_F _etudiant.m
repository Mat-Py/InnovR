function [F] = estimate_F(xh1,xh2)
% ESTIMATE_F -
%
%   Input : pairs of correspondent points :
%   N : number of points
%   xh1 : 2xN set of 2D points in the 1st image 
%   xh2 : 2xN set of 2D points in the 2nd image 
%   xh1(:,i) and xh2 (:,i) are matched together
%
%   Ouput : 
%   F : 3x3 matrix, the fundamental from image 1 to image 2

%Number of points
[dim,N] = size(xh1);
%if(N < 4)
% error ('Need at least 4 pairs of points !')
%end

if(dim == 2)
    hhh  = ones(1,N);
    xh1 = [xh1;hhh];
    xh2 = [xh2;hhh];
end


%Fill A of min||Ax||
A = [];
% more fun to complete


 
[~,s,v] = svd(A, 0); 
 
%singular value are sorted 
f = v(:,9);

F = reshape(f,3,3)';

