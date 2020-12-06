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
Vyx = 0;
Vyz = 0;
Vzy = 0;
Vxz = 0;
Vzx = 0;
Gxy = 0;
Gyz = 0;
Gxz = 0;

%Strains
e_xx = (sigma_xx/Ex)-(Vyx*sigma_yy/Ey)-(Vzx*sigma_zz/Ez)
e_yy = (-Vxy*sigma_xx/Ex)+(sigma_yy/Ey)-(Vzy*sigma_zz/Ez)
e_zz = (-Vxz*sigma_xx/Ex)-(Vyz*sigma_yy/Ey)+(sigma_zz/Ez)
r_xy = sigma_xy/Gxy
e_xy = r_xy/2
r_yz = sigma_yz/Gyz
e_yz = r_yz/2
r_xz = sigma_xz/Gxz
e_xz = r_xz/2
