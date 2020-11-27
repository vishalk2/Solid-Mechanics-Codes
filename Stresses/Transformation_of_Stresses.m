clear all; clc
%Original Stress componentes along x,y,and z axes
sigma_xx = 0;
sigma_yy = 0;
sigma_zz = 0;
sigma_xy = 0;
sigma_yz = 0;
sigma_xz = 0;
T = [sigma_xx,sigma_xy,sigma_xz;...
    sigma_xy,sigma_yy,sigma_yz;...
    sigma_xz,sigma_yz,sigma_zz]

%Direction cosines & Normal Vectors
l1 = 0;
m1 = 0;
n1 = 0;
N_1 = [l1 m1 n1]'

l2 = 0;
m2 = 0;
n2 = 0;
N_2 = [l2 m2 n2]'

l3 = 0;
m3 = 0;
n3 = 0;
N_3 = [l3 m3 n3]'

%Stress Vectors in new axes
sigma_X = T*N_1
sigma_Y = T*N_2
sigma_Z = T*N_3

%Stress components in new axes
sigma_XX = (T*N_1)'*N_1
sigma_YY = (T*N_2)'*N_2
sigma_ZZ = (T*N_3)'*N_3
sigma_XY = (T*N_1)'*N_2
sigma_YZ = (T*N_2)'*N_3
sigma_XZ = (T*N_1)'*N_3

%New Stress Tensor
T_new = [l1 m1 n1;l2 m2 n2;l3 m3 n3]*[sigma_xx sigma_xy sigma_xz;sigma_xy sigma_yy sigma_yz;sigma_xz sigma_yz sigma_zz]*[l1 l2 l3;m1 m2 m3;n1 n2 n3]
