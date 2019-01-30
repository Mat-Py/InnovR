function [xh1,xh2,width] = load_data_F()
% LOAD_DATA_F -
%
%   Input :
%   conf : configuration of set of points
%
%   Outputs : pairs of correspondent points :
%   N : number of points
%   xh1 : 2xN set of 2D points in the 1st image, homogeneous coordinates 
%   xh2 : 2xN set of 2D points in the 2nd image, homogeneous coordinates
%   xh1(:,i) and xh2 (:,i) are matched together




%Set of correspondent points 
%matching process already performed
xh1=[     
        40.7050  230.0510  399.6440  337.8360  230.4960  315.7170 234.6810  305.1270  
         451.8970  433.9440  446.8190  320.3020  286.1480  274.8440 104.5840   142.8560  
    ];
xh2 = [
        18.8581  235.1970  429.1350  351.9130  237.7510  326.7980 242.3910     316.0750
       488.3910  468.3580  487.0110 331.3220  292.0930  280.3260  100.3080      142.1450 
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
%image size
[~, width, ~] = size(im1);

%Display
subplot(221);
image(im1);
hold on
for i=1:1:N
    plot(xh1(1,i),xh1(2,i),'g+');
end
% 2nd image, 2nd case
subplot(222);
image(im2);
hold on
for i=1:1:N
    plot(xh2(1,i),xh2(2,i),'g+');
end
%To set the grey value range
gray = [
    0:255 ; 0:255 ; 0:255
    ];
colormap(gray'/255);



