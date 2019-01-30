function [xh1,xh2] = load_data_H()
% LOAD_DATA_H -
%
%
%   Outputs : pairs of correspondent points :
%   N : number of points
%   xh1 : 2xN set of 2D points in the 1st image, homogeneous coordinates 
%   xh2 : 2xN set of 2D points in the 2nd image, homogeneous coordinates
%   xh1(:,i) and xh2 (:,i) are matched together


%matching process already performed
%Points are located on the ground
%only small noise, no mis-match
xh1=[
     230.4960 315.7170 230.0510  399.6440  337.8360    40.7050 %363.4
      286.1480 274.8440 433.9440  446.8190  320.3020  451.8970  %370.4
    ];
xh2 = [
       237.7510 326.7980 235.1970  429.1350  351.9130  18.8581 %382.4
       292.0930  280.3260  468.3580  487.0110 331.3220  488.3910 %390.4
    ];
    

if (size(xh1) ~= size(xh2))
 error ('Input point sets are different sizes!')
end

%Number of points
[dim,N] = size(xh1);

if(dim == 2)
    hhh  = ones(1,N);
    xh1 = [xh1;hhh];
    xh2 = [xh2;hhh];
end

%Display images + points
%Window with several images : 2 lines, 2 columns
%Read images from files
[im1] = imread('bt.000.png');
[im2] = imread('bt.002.png');
%Display
subplot(221);
image(im1);
hold on
for i=1:1:N
    plot(xh1(1,i),xh1(2,i),'g*');
end
% 2nd image, 2nd case
subplot(222);
image(im2);
hold on
for i=1:1:N
    plot(xh2(1,i),xh2(2,i),'g*');
end
%To set the grey value range
gray = [
    0:255 ; 0:255 ; 0:255
    ];
colormap(gray'/255);
  



