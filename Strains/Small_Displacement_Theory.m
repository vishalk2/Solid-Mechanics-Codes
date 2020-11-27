%Small Displacement Theory
clear all; clc
format long g
syms x y z
%Give functions for u,v and w
u = (0.004/3)*x*y*z;
v = (0.002/3)*x*y*z;
w = -(0.004/3)*x*y*z;
%Direction cosines
l = 0;
m = 0;
n = 0;

%Partial derivatives
u_x = diff(u,x);
u_y = diff(u,y);
u_z = diff(u,z);
v_x = diff(v,x);
v_y = diff(v,y);
v_z = diff(v,z);
w_x = diff(w,x);
w_y = diff(w,y);
w_z = diff(w,z);

%Components of Green Strain
e_xx = u_x
e_yy = v_y
e_zz = w_z
e_xy = (1/2)*(v_x+u_y) %e_yx
e_xz = (1/2)*(w_x+u_z) %e_zx
e_yz = (1/2)*(w_y+v_z) %e_zy
r_xy = 2*e_xy
r_xz = 2*e_xz
r_yz = 2*e_yz

%Magnification factor
M = (l^2)*e_xx + (m^2)*e_yy + (n^2)*e_zz + 2*l*m*e_xy + 2*l*n*e_xz + 2*m*n*e_yz

