%Principal Strains
clear all; clc;
format long g

%Strains
e_xx = 0;
e_yy = 0;
e_zz = 0;
e_xy = 0;
e_yz = 0;
e_xz = 0;
%Stress tensor
T = [e_xx e_xy e_xz;e_xy e_yy e_yz;e_xz e_yz e_zz]

%Strain Invariants
I1 = e_xx + e_yy + e_zz
I2 = e_xx*e_yy + e_xx*e_zz + e_zz*e_yy - e_xy^2 - e_yz^2 - e_xz^2
I3 = det(T)

%Magnification factor solutions
M = roots([1,-I1,I2,-I3])

%Finding direction cosines
syms l m n
for i=1:3
    disp('Start of iteration')
    eqn1 = l^2 + m^2 + n^2 == 1
    eqn2 = l*(e_xx-M(i)) + m*e_xy + n*e_xz == 0
    eqn3 = l*e_xy + m*(e_yy-M(i)) + n*e_yz == 0
    eqn4 = l*e_xz + m*e_yz + n*(e_zz-M(i)) == 0
    [L M N] = solve([eqn1 eqn2 eqn3],[l m n]);
    Normal_Vector = [double(L) double(M) double(N)]'
    disp('End of iteration')
    disp('----------------')
end
