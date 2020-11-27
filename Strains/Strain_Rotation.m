%Rotation between two line elements
clear all; clc;
format long g

%Direction cosines
l1 = 0;
m1 = 0;
n1 = 0;
l2 = 0;
m2 = 0;
n2 = 0;
l3 = 0;
m3 = 0;
n3 = 0;

%Strains in initial Plane with axes x,y and z
e_xx = 0;
e_yy = 0;
e_zz = 0;
e_xy = 0; %e_yz
e_yz = 0; %e_zy
e_xz = 0; %e_zx
r_xy = 2*e_xy
r_yz = 2*e_yz
r_xz = 2*e_xz

%Strains in an arbitrary plane with axes X,Y and Z
e_XX = (l1^2)*e_xx + (m1^2)*e_yy + (n1^2)*e_zz + 2*l1*m1*e_xy + 2*l1*n1*e_xz + 2*m1*n1*e_yz
e_YY = (l2^2)*e_xx + (m2^2)*e_yy + (n2^2)*e_zz + 2*l2*m2*e_xy + 2*l2*n2*e_xz + 2*m2*n2*e_yz
e_ZZ = (l3^2)*e_xx + (m3^2)*e_yy + (n3^2)*e_zz + 2*l3*m3*e_xy + 2*l3*n3*e_xz + 2*m3*n3*e_yz
e_XY = l1*l2*e_xx + m1*m2*e_yy + n1*n2*e_zz + (l1*m2+l2*m1)*e_xy + (m1*n2+m2*n1)*e_yz + (l1*n2+l2*n1)*e_xz
r_XY = e_XY/2
e_YZ = l3*l2*e_xx + m3*m2*e_yy + n3*n2*e_zz + (l3*m2+l2*m3)*e_xy + (m3*n2+m2*n3)*e_yz + (l3*n2+l2*n3)*e_xz
r_YZ = e_YZ/2
e_XZ = l1*l3*e_xx + m1*m3*e_yy + n1*n3*e_zz + (l1*m3+l3*m1)*e_xy + (m1*n3+m3*n1)*e_yz + (l1*n3+l3*n1)*e_xz
r_XZ = e_XZ/2
