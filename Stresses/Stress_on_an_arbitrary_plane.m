clear all; clc
%Stress components
sigma_xx = 50;
sigma_yy = -30;
sigma_zz = 20;
sigma_xy = 5;
sigma_yz = 0;
sigma_xz = -30;
T = [sigma_xx,sigma_xy,sigma_xz;...
    sigma_xy,sigma_yy,sigma_yz;...
    sigma_xz,sigma_yz,sigma_zz]

%Direction cosines & Normal Vector
l = 1/sqrt(3);
m = 1/sqrt(3);
n = 1/sqrt(3);
N = [l m n]'

%Stress acting on an arbtrary plane
syms sigma_Px sigma_Py sigma_Pz
sigma_p = [sigma_Px;sigma_Py;sigma_Pz] == T*N
sigma_P = T*N

%Normal Stress acting on an arbtrary plane
syms sigma_PN
sigma_normal = sigma_PN == (T*N)'*N
sigma_pn = (T*N)'*N

%Shear stress acting on an arbitrary plane
syms sigma_PS
sigma_shear = sigma_PS == sqrt(sigma_Px^2 + sigma_Py^2 + sigma_Pz^2 - sigma_PN^2)
sigma_ps = sqrt(sigma_P(1)^2 + sigma_P(2)^2 + sigma_P(3)^2 - sigma_pn^2)

