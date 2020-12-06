%Orthotropic Elasticity Relations
clear all; clc
format long g

%Stresses
sigma_xx = 0;
sigma_yy = 0;
sigma_zz = 0;
sigma_xy = 0;
sigma_yz = 0;
sigma_xz = 0;

%Material Properties
Ex = 0;
Ey = 0;
Ez = 0;
Vxy = 0;
Vyz = 0;
Vxz = 0;
Gxy = 0;
Gyz = 0;
Gxz = 0;

%Strains
e_xx = (sigma_xx/Ex)-(Vxy*sigma_yy/Ey)-(Vxz*sigma_zz/Ez)
e_yy = (-Vxy*sigma_xx/Ex)+(sigma_yy/Ey)-(Vyz*sigma_zz/Ez)
e_zz = (-Vxy*sigma_xx/Ex)-(Vyz*sigma_yy/Ey)+(sigma_zz/Ez)
r_xy = sigma_xy/Gxy
r_yz = sigma_yz/Gyz
r_xz = sigma_xz/Gxz
