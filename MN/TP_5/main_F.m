 %Load data
 [xh1,xh2,width] = load_data_F();
 %Number of pairs of points
 [~,N] = size(xh1);
 
 F = estimate_F(xh1,xh2);
 error = display_warp_F(xh1,xh2,F,width);