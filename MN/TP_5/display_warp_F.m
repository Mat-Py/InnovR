function [error] = display_warp_F(xh1,xh2,F,width)

% DISPLAY_WARP_F -
%
%   Input : pairs of correspondent points :
%   N : number of points
%   xh1 : 2xN set of 2D points in the 1st image, homogeneous coordinates 
%   xh2 : 2xN set of 2D points in the 2nd image, homogeneous coordinates 
%   xh1(:,i) and xh2 (:,i) are matched together
%   F : 3x3 matrix, the homography from image 1 to image 2
%
%   Output :
%   error : the average error of reprojection 


%Number of points
[~,N] = size(xh1);
%Projection
l2proj = warp_F(xh1,F);
% Cartesian coordinates to compute error
for i=1:1:N
    xh2(:,i) = xh2(:,i)/xh2(3,i);
end
%Estimate error of projection
error = 0;
for i=1:1:N
    norm = sqrt(l2proj(1,i).^2 +  l2proj(2,i).^2);
    error = error + (l2proj(1,i)*xh2(1,i) + l2proj(2,i)*xh2(2,i) + l2proj(3,i))/norm;
end
error = sqrt(error) / N;

%Display them
extrem_x = [0 width];
subplot(222);
hold on
for i=1:1:N 
    extrem_y = (-l2proj(1,i)*extrem_x -  l2proj(3,i))/ l2proj(2,i);
    plot(extrem_x,extrem_y,'r');
end
 