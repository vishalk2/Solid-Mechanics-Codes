%Strain-Energy Density of Isotropic Elastic Materials
clear all; clc
format long

%Strains
e_xx = 0;
e_yy = 0;
e_zz = 0;
e_xy = 0;
e_yz = 0;
e_xz = 0;

%Strain Invariants
I1 = e_xx + e_yy + e_zz;
I2 = e_xx*e_yy + e_yy*e_zz + e_xx*e_zz - e_xy^2 - e_yz^2 - e_xz^2;

%Material Properties
E = 0; %Young's Modulus
v = 0; %Poisson's ratio

G = E/(2*(1+v)) %Shear Modulus or Lame's Coefficient
lambda = v*E/((1+v)*(1-2*v)) %Lame's Coefficient
K = E/(3*(1-2*v)) %Bulk Modulus

%Stresses
sigma_xx = E*((1-v)*e_xx+v*(e_yy+e_zz))/((1+v)*(1-2*v))
sigma_yy = E*((1-v)*e_yy+v*(e_xx+e_zz))/((1+v)*(1-2*v))
sigma_zz = E*((1-v)*e_zz+v*(e_yy+e_xx))/((1+v)*(1-2*v))
sigma_xy = E*e_xy/(1+v)
sigma_xz = E*e_xz/(1+v)
sigma_yz = E*e_yz/(1+v)

%Strain Energy Density
U0 = (0.5*lambda+G)*(I1^2) - 2*G*I2
