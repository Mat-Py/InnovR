function [lwarp] = warp_F (xh,F)

%WARP_F -
%
%   Input : 
%   N : number of points
%   xh : 2xN set of 2D points in the 1st image, homogeneous coordinates 
%   F : 3x3 matrix, the fundamental matrix from image 1 to image 2
%
%   Output :
%   lwarp : the lines in image 2

[dim,N] = size(xh);
%Homogeneous coordinates
if(dim==2)
    xh = [xh;ones(1,N)];
end

%Warp every point of image 1  onto the image 2 : get a b c line parameters
lwarp = [];
for i=1:1:N
    lwarp = [lwarp F*xh(:,i)];
end