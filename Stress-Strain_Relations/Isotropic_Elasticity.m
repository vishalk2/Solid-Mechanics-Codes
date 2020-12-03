%Strain Energy Density of Isotropic Elastic Materials
clear all; clc
format long

%Lame's elastic coefficients
lambda = 0;
G = 0;

%Strains
e_xx = 0;
e_yy = 0;
e_zz = 0;
e_xy = 0;
e_xz = 0;
e_yz = 0;

%Strain Invariants
I1 = e_xx + e_yy + e_zz
I2 = e_xx*e_yy + e_yy*e_zz + e_xx*e_zz - e_xy^2 - e_yz^2 - e_xz^2
e = I1
I3 = det([e_xx e_xy e_xz;e_xy e_yy e_yz;e_xz e_yz e_zz])

%Strain Energy Density
U0 = (0.5*lambda + G)*(I1^2) - 2*G*I2

%Stresses
sigma_xx = lambda*e + 2*G*e_xx
sigma_yy = lambda*e + 2*G*e_yy
sigma_zz = lambda*e + 2*G*e_zz
sigma_xy = 2*G*e_xy
sigma_xz = 2*G*e_xz
sigma_yz = 2*G*e_yz

%Stress Invariants
I11 = (3*lambda+2*G)*I1
I22 = lambda*(3*lambda+4*G)*(I1^2) + 4*(G^2)*I2
I33 = (lambda^2)*(lambda+2*G)*(I1^3) + 4*lambda*(G^2)*I1*I2 + 8*(G^3)*I3

%If Principal Strains are given
e_1 = 0;
e_2 = 0;
e_3 = 0;
%Strain Energy Density
U = 0.5*lambda*((e_1+e_2+e_3)^2) + G*((e_1^2)+(e_2^2)+(e_3^2))
