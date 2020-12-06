%Thermoelasticity Relations for Isotropic Materials
clear all; clc
format long g

%Material Properties
E = 0; %Young's Modulus
v = 0; %Poisson's ratio
alpha = 0; %Coefficient of Thermal Expansion of material
delta_T = 0; %Change in Temperature

G = E/(2*(1+v)) %Shear Modulus or Lame's Coefficient
lambda = v*E/((1+v)*(1-2*v)) %Lame's Coefficient
K = E/(3*(1-2*v)) %Bulk Modulus
c = alpha*(3*lambda+2*G)

%Stresses
sigma_xx = 0;
sigma_yy = 0;
sigma_zz = 0;
sigma_xy = 0;
sigma_yz = 0;
sigma_xz = 0;
I1 = sigma_xx + sigma_yy + sigma_zz
I2 = sigma_xx*sigma_yy + sigma_xx*sigma_zz + sigma_yy*sigma_zz - sigma_xy^2 - sigma_yz^2 - sigma_xz^2;

%Strains
e_xx = ((sigma_xx-v*(sigma_yy+sigma_zz))/E)+alpha*delta_T
e_yy = ((sigma_yy-v*(sigma_xx+sigma_zz))/E)+alpha*delta_T
e_zz = ((sigma_zz-v*(sigma_yy+sigma_xx))/E)+alpha*delta_T
e_xy = (1+v)*sigma_xy/E
e_yz = (1+v)*sigma_yz/E
e_xz = (1+v)*sigma_xz/E

%Strain-Energy Density
U0 = ((I1^2)-2*(1+v)*I2)/(2*E)
