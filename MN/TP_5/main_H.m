 %Load data
 [xh1,xh2] = load_data_H();
 %Number of pairs of points
 [~,N] = size(xh1);
 
 H = estimate_H_etudiant(xh1,xh2);
 error = display_warp_H(xh1,xh2,H);