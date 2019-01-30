function [error] = display_warp_H(xh1,xh2,H)

% DISPLAY_WARP_H -
%
%   Input : pairs of correspondent points :
%   xh1 : 2xN set of 2D points in the 1st image, homogeneous coordinates 
%   xh2 : 2xN set of 2D points in the 2nd image, homogeneous coordinates 
%   xh1(:,i) and xh2 (:,i) are matched together
%   H : 3x3 matrix, the homography from image 1 to image 2
%
%   Output :
%   error : the average error of reprojection 


%Number of points
[~,N] = size(xh1);

%Projection
x2proj = warp_H(xh1,H);
% Cartesian coordinates to compute error
for i=1:1:N
    x2proj(:,i) = x2proj(:,i)/x2proj(3,i);
    xh2(:,i) = xh2(:,i)/xh2(3,i);
end
%Estimate error of projection
x2proj = x2proj(1:2,:);
error = 0;
for i=1:1:N
    error = error + ((x2proj(1,i) - xh2(1,i)).^2) + ((x2proj(2,i) - xh2(2,i)).^2);
end
error = sqrt(error) / N;

%Display them
subplot(222);
hold on
for i=1:1:N
    plot(x2proj(1,i),x2proj(2,i),'r+');
end
 