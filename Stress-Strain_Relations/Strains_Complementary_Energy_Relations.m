%Stress Strain Relations - C0 (Complementary Internal Energy Density)
syms sigma_xx sigma_yy sigma_zz sigma_xy sigma_yz sigma_xz
C0 = 0; %C0 as a function of stresses
e_xx = diff(C0,sigma_xx)
e_yy = diff(C0,sigma_yy)
e_zz = diff(C0,sigma_zz)
e_xy = diff(C0,sigma_xy)
e_yz = diff(C0,sigma_yz)
e_xz = diff(C0,sigma_xz)
