function [xwarp] = warp_H (xh,H)

%WARP_H -
%
%   Input : 
%   N : number of points
%   xh : 2xN set of 2D points in the 1st image, homogeneous coordinates 
%   H : 3x3 matrix, the homography from image 1 to image 2
%
%   Output :
%   xwarp : the points warped using H

[dim,N] = size(xh);
%Homogeneous coordinates
if(dim ==2)
    xh = [xh;ones(1,N)];
end

%Warp every point of image 1  onto the image 2
xwarp = [];
for i=1:1:N
    xwarp = [xwarp H*xh(:,i)];
    xwarp(:,i) = xwarp(:,i)/xwarp(3,i);
end