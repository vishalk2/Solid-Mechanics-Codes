%Strain-Energy Density of Isotropic Materials
clear all; clc
format long

%Stresses
sigma_xx = 0;
sigma_yy = 0;
sigma_zz = 0;
sigma_xy = 0;
sigma_xz = 0;
sigma_yz = 0;

%Mean Stress
I1 = sigma_xx+sigma_yy+sigma_zz;
I2 = sigma_xx*sigma_yy + sigma_xx*sigma_zz + sigma_yy*sigma_zz - sigma_xy^2 - sigma_yz^2 - sigma_xz^2;
sigma_m = I1/3

%Material Properties
E = 0; %Young's Modulus
v = 0; %Poisson's Ratio

G = E/(2*(1+v)) %Shear Modulus or Lame's Coefficient
lambda = v*E/((1+v)*(1-2*v)) %Lame's Coefficient
K = E/(3*(1-2*v)) %Bulk Modulus

%Strains
e_xx = (sigma_xx-v*sigma_yy-v*sigma_zz)/E
e_yy = (sigma_yy-v*sigma_xx-v*sigma_zz)/E
e_zz = (sigma_zz-v*sigma_xx-v*sigma_yy)/E
e_xy = sigma_xy/(2*G)
e_xz = sigma_xz/(2*G)
e_yz = sigma_yz/(2*G)

%Strain Energy Density
U0 = ((I1^2)-2*(1+v)*I2)/(2*E)
