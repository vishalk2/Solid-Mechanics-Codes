%Strain Theory
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
e_xx = u_x + (1/2)*((u_x^2)+(v_x^2)+(w_x^2))
e_yy = v_y + (1/2)*((u_y^2)+(v_y^2)+(w_y^2))
e_zz = w_z + (1/2)*((u_z^2)+(v_z^2)+(w_z^2))
e_xy = (1/2)*(v_x+u_y+(u_x*u_y)+(v_x*v_y)+(w_x*w_y)) %e_yx
e_xz = (1/2)*(w_x+u_z+(u_x*u_z)+(v_x*v_z)+(w_x*w_z)) %e_zx
e_yz = (1/2)*(w_y+v_z+(u_y*u_z)+(v_y*v_z)+(w_y*w_z)) %e_zy
r_xy = 2*e_xy
r_yz = 2*e_yz
r_xz = 2*e_xz

%Magnification factor
M = (l^2)*e_xx + (m^2)*e_yy + (n^2)*e_zz + 2*l*m*e_xy + 2*l*n*e_xz + 2*m*n*e_yz

%Engineering Strain
syms epsilon_E
eqn = epsilon_E + (1/2)*(epsilon_E^2) == subs(M,[x,y,z],[1,1,1])
e_E = solve(eqn,epsilon_E)
e_e = 0; %Input that value of e_E that is greater than -1

%New Direction cosines
l_new = ((1+u_x)*l+u_y*m+u_z*n)/(e_e+1)
m_new = (v_x*l+(1+v_y)*m+v_z*n)/(e_e+1)
n_new = (w_x*l+w_y*m+(1+w_z)*n)/(e_e+1)
