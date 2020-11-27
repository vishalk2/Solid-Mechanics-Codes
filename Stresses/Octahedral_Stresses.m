clear all; clc
sigma_xx = 80;
sigma_yy = -21;
sigma_zz = 99;
sigma_xy = 64;
sigma_yz = 21;
sigma_xz = -4;

%I variants
I1 = sigma_xx + sigma_yy + sigma_zz
I2 = det([sigma_xx sigma_xy;sigma_xy sigma_yy]) + det([sigma_xx sigma_xz;sigma_xz sigma_zz]) + det([sigma_yy sigma_yz;sigma_yz sigma_zz])
I3 = det([sigma_xx sigma_xy sigma_xz;...
    sigma_xy sigma_yy sigma_yz;...
    sigma_xz sigma_yz sigma_zz])

%Octahedral Stresses
syms sigma_oct tau_oct
Sigma_oct = sigma_oct == (1/3)*(sigma_xx + sigma_yy + sigma_zz)
Tau_oct = tau_oct == (1/3)*sqrt((sigma_xx-sigma_yy)^2 + (sigma_yy-sigma_zz)^2 + (sigma_zz-sigma_xx)^2 + 6*(sigma_xy^2 + sigma_yz^2 + sigma_xz^2))

%Mean & Deviator stresses
syms sigma_m
Sigma_m = sigma_m == (1/3)*(sigma_xx + sigma_yy + sigma_zz)
sigma_M = (1/3)*(sigma_xx + sigma_yy + sigma_zz);

%Stress variants for Td
J1 = 0
J2 = I2 - (1/3)*(I1^2)
J3 = I3 - (1/3)*I1*I2 + (2/27)*(I1^3)

%Principal values of deviatoric tensor Td
S1 = sigma_xx - sigma_M
S2 = sigma_yy - sigma_M
S3 = sigma_zz - sigma_M

S1+S2+S3
