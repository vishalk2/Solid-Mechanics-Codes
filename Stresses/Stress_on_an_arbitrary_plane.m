clear all; clc
%Stress components
sigma_xx = 100;
sigma_yy = 60;
sigma_zz = 20;
sigma_xy = 40;
sigma_yz = 80;
sigma_xz = 0;
T = [sigma_xx,sigma_xy,sigma_xz;...
    sigma_xy,sigma_yy,sigma_yz;...
    sigma_xz,sigma_yz,sigma_zz]

%Direction cosines & Normal Vector
l = 0.8;
m = 0.6;
n = 0;
N = [l m n]'

%Stress acting on an arbtrary plane
sigma_P = T*N
sigma_P_mag = norm(sigma_P) %Magnitude
sigma_Px = sigma_P(1)
sigma_Py = sigma_P(2)
sigma_Pz = sigma_P(3)

%Normal Stress acting on an arbtrary plane
sigma_PN = (T*N)'*N

%Shear stress acting on an arbitrary plane
sigma_PS = sqrt(sigma_Px^2 + sigma_Py^2 + sigma_Pz^2 - sigma_PN^2)
